#!/bin/bash
# Release Harbor City. Run on Koko's Mac: bash ~/GTA2027/scripts/release.sh <version> <code>   e.g. 0.52.1 87
# Prerequisite: the version bump (export_presets.cfg), startup toast, site/index.html and docs/releases/v<version>.md are already edited (uncommitted is fine).
# Stops at the first problem. Restores your branch, save file and untracked files on exit.
set -euo pipefail

main() {
  REPO="$HOME/GTA2027"
  GODOT="$HOME/harbor-city/tools/Godot.app/Contents/MacOS/Godot"
  export JAVA_HOME="$HOME/harbor-city/tools/jdk17/jdk-17.0.21+9/Contents/Home"
  export ANDROID_HOME="$HOME/harbor-city/tools/android-sdk"
  VER="${1:?usage: release.sh <version> <code>}"; CODE="${2:?usage: release.sh <version> <code>}"
  SAVE="$HOME/Library/Application Support/Godot/app_userdata/Harbor City/harbor_save.cfg"
  ASIDE="$(mktemp -d /tmp/hc-aside.XXXXXX)"
  START_BRANCH="$(git -C "$REPO" branch --show-current)"
  LOG="$ASIDE/log"; mkdir -p "$LOG"

  cd "$REPO"
  command -v gh >/dev/null || { echo "gh is not installed"; exit 1; }
  gh auth status >/dev/null 2>&1 || { echo "Run 'gh auth login' first"; exit 1; }
  [ -x "$GODOT" ] || { echo "Godot not found at $GODOT"; exit 1; }
  grep -q "version/name=\"$VER\"" game/export_presets.cfg && grep -q "version/code=$CODE" game/export_presets.cfg || { echo "Version bump to $VER / $CODE missing in game/export_presets.cfg"; exit 1; }
  [ -f "docs/releases/v$VER.md" ] || { echo "docs/releases/v$VER.md missing"; exit 1; }

  restore() {
    set +e
    cd "$REPO"
    if [ -d "$ASIDE/files" ]; then
      (cd "$ASIDE/files" && find . -type f -print0) | while IFS= read -r -d '' f; do
        mkdir -p "$(dirname "$REPO/$f")"; mv "$ASIDE/files/$f" "$REPO/$f"
      done
    fi
    [ -f "$ASIDE/save.bak" ] && cp "$ASIDE/save.bak" "$SAVE"
    if [ -n "$START_BRANCH" ] && [ "$(git branch --show-current)" != "$START_BRANCH" ]; then
      git checkout "$START_BRANCH"
    fi
    echo "Restored your files, save and branch ($START_BRANCH). Logs: $LOG"
  }
  trap restore EXIT

  echo "== 1. Back up save, switch to main, set aside untracked files"
  [ -f "$SAVE" ] && cp "$SAVE" "$ASIDE/save.bak"
  git checkout main
  git pull --ff-only origin main
  git ls-files --others --exclude-standard -z | while IFS= read -r -d '' f; do
    [ "$f" = "scripts/release.sh" ] && continue
    mkdir -p "$ASIDE/files/$(dirname "$f")"; mv "$f" "$ASIDE/files/$f"
  done

  echo "== 2. Import + smoke test (about 1-2 min)"
  "$GODOT" --headless --path game --import >"$LOG/import.txt" 2>&1 || true
  "$GODOT" --headless --path game -- --smoke-test >"$LOG/smoke.txt" 2>&1 &
  GPID=$!
  ( sleep 400; kill "$GPID" 2>/dev/null ) &
  WPID=$!
  wait "$GPID" 2>/dev/null || true
  kill "$WPID" 2>/dev/null || true
  grep -q HARBOR_SMOKE_OK "$LOG/smoke.txt" || { echo "Smoke test did not pass. See $LOG/smoke.txt"; exit 1; }
  if grep -q "SCRIPT ERROR" "$LOG/smoke.txt"; then echo "SCRIPT ERROR in smoke test. See $LOG/smoke.txt"; exit 1; fi
  [ -f "$ASIDE/save.bak" ] && cp "$ASIDE/save.bak" "$SAVE"

  echo "== 3. Export Android APK and Web"
  mkdir -p builds site/play
  rm -f builds/Harbor-City-Android-debug.apk builds/Harbor-City-Android-debug.apk.idsig
  "$GODOT" --headless --path game --export-debug "Android" ../builds/Harbor-City-Android-debug.apk >"$LOG/export-apk.txt" 2>&1
  rm -f builds/Harbor-City-Android-debug.apk.idsig
  "$GODOT" --headless --path game --export-release "Web" ../site/play/index.html >"$LOG/export-web.txt" 2>&1
  [ -s builds/Harbor-City-Android-debug.apk ] || { echo "APK missing. See $LOG/export-apk.txt"; exit 1; }

  echo "== 4. Verify APK"
  APKSIGNER="$(ls -d "$ANDROID_HOME"/build-tools/*/apksigner | sort | tail -1)"
  AAPT="$(ls -d "$ANDROID_HOME"/build-tools/*/aapt | sort | tail -1)"
  "$APKSIGNER" verify --print-certs builds/Harbor-City-Android-debug.apk | tee "$LOG/cert.txt"
  grep -q 5168f1fa527ea9b9ea183d442285192de49dfe0d5b6cf0e0590421b84b5f547b "$LOG/cert.txt" || { echo "Wrong signing certificate"; exit 1; }
  "$AAPT" dump badging builds/Harbor-City-Android-debug.apk | head -1 | tee "$LOG/badging.txt"
  grep -q "versionName='$VER'" "$LOG/badging.txt" && grep -q "versionCode='$CODE'" "$LOG/badging.txt" || { echo "Wrong APK version"; exit 1; }

  SHA="$(shasum -a 256 builds/Harbor-City-Android-debug.apk | cut -d' ' -f1)"
  BYTES="$(stat -f%z builds/Harbor-City-Android-debug.apk)"
  printf '\nSHA256: %s\nBytes: %s\nPackage: com.koko.harborcity, version %s / code %s.\nCertificate SHA256: 5168f1fa527ea9b9ea183d442285192de49dfe0d5b6cf0e0590421b84b5f547b\n' "$SHA" "$BYTES" "$VER" "$CODE" >> docs/releases/v$VER.md

  echo "== 5. Commit and push main"
  git add game/export_presets.cfg game/main.gd site docs/releases/v$VER.md CLAUDE-HANDOVER.md scripts/release.sh
  git commit -q -m "Harbor City $VER

Co-Authored-By: Claude Sonnet 5.5 <noreply@anthropic.com>
Claude-Session: https://claude.ai/code/session_01BK9nDEtMZ7hrgadbsK5LH9"
  git push origin main
  [ -z "$(git status --porcelain)" ] || { echo "Working tree not clean:"; git status --short; exit 1; }

  echo "== 6. Publish release"
  python3 scripts/publish-release.py builds/Harbor-City-Android-debug.apk --notes docs/releases/v$VER.md

  echo "== 7. Pages workflow"
  for i in 1 2 3; do
    sleep 45
    gh run list --workflow pages.yml --limit 1
    STATUS="$(gh run list --workflow pages.yml --limit 1 --json status,conclusion --jq '.[0].conclusion // .[0].status')"
    [ "$STATUS" = "success" ] && break
    if [ "$STATUS" = "failure" ]; then gh workflow run pages.yml --ref main; fi
  done

  echo "== 8. Verify live"
  curl -fsSL https://kokolo2020.github.io/GTA2027/release.json | tee "$LOG/live.json"; echo
  grep -q "$VER" "$LOG/live.json" || echo "WARNING: live release.json does not show $VER yet (Pages may still be deploying)"
  echo "Release: https://github.com/kokolo2020/GTA2027/releases/tag/v$VER"
  echo "APK SHA256: $SHA"

  echo "== 9. Update handover"
  python3 - "$VER" "$SHA" "$CODE" <<'PY'
import sys,re
ver,sha,code=sys.argv[1:4]
p="CLAUDE-HANDOVER.md"; s=open(p).read()
s=re.sub(r"\*\*Live version: [^*]*\*\*\s*\(next is \d+\)\.","**Live version: %s, versionCode %s** (next is %d)."%(ver,code,int(code)+1),s,count=1)
s=re.sub(r"\*\*Committed on main, not released yet:.*?when Koko says \"Release\"\.","**Last release: %s.**"%ver,s,count=1,flags=re.S)
s+="\n\n## Released and verified %s (%s)\nRelease https://github.com/kokolo2020/GTA2027/releases/tag/v%s, APK SHA256 %s. Desktop smoke test passed; not checked on a phone.\n"%(ver,__import__("datetime").date.today(),ver,sha)
open(p,"w").write(s)
PY
  git add CLAUDE-HANDOVER.md
  git commit -q -m "Record verified v$VER release

Co-Authored-By: Claude Sonnet 5.5 <noreply@anthropic.com>
Claude-Session: https://claude.ai/code/session_01BK9nDEtMZ7hrgadbsK5LH9"
  git push origin main
  echo "DONE: Harbor City $VER released."
}
main "$@"
exit $?
