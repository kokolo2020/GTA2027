#!/usr/bin/env python3
"""Verify a locally signed APK, publish a GitHub release, and refresh Pages metadata."""
import argparse
import hashlib
import json
import os
from pathlib import Path
import re
import shutil
import subprocess
import tempfile
import zipfile

ROOT = Path(__file__).resolve().parents[1]
REPO = "kokolo2020/GTA2027"
CERT = "5168f1fa527ea9b9ea183d442285192de49dfe0d5b6cf0e0590421b84b5f547b"

def run(args, **kwargs):
    return subprocess.check_output([str(x) for x in args], cwd=ROOT, text=True, **kwargs).strip()

def tool(name):
    found = shutil.which(name)
    if found:
        return found
    sdk = Path(os.environ.get("ANDROID_HOME", Path.home() / "harbor-city/tools/android-sdk"))
    candidates = sorted((sdk / "build-tools").glob("*/" + name), reverse=True)
    if not candidates:
        raise SystemExit("Missing " + name + ". Install official Android SDK build tools or set ANDROID_HOME.")
    return str(candidates[0])

def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("apk", type=Path)
    parser.add_argument("--notes", type=Path, required=True, help="Reviewed release notes file")
    parser.add_argument("--check-only", action="store_true")
    args = parser.parse_args()
    apk = args.apk.resolve()
    notes = args.notes.resolve()
    if not notes.is_file():
        raise SystemExit("Release notes file does not exist")
    data = apk.read_bytes()
    with zipfile.ZipFile(apk) as archive:
        if archive.testzip() is not None:
            raise SystemExit("APK ZIP integrity failed")
    env = os.environ.copy()
    fallback_java = Path.home() / "harbor-city/tools/jdk17/jdk-17.0.21+9/Contents/Home"
    if not env.get("JAVA_HOME") and fallback_java.is_dir():
        env["JAVA_HOME"] = str(fallback_java)
    signature = run([tool("apksigner"), "verify", "--verbose", "--print-certs", apk], env=env)
    if "certificate SHA-256 digest: " + CERT not in signature:
        raise SystemExit("Signing certificate differs from existing installations; refusing release")
    badging = run([tool("aapt"), "dump", "badging", apk])
    package = re.search(r"package: name='([^']+)' versionCode='(\d+)' versionName='([^']+)'", badging)
    preset = (ROOT / "game/export_presets.cfg").read_text()
    version = re.search(r'version/name="([^"]+)"', preset).group(1)
    code = re.search(r"version/code=(\d+)", preset).group(1)
    if not package or package.groups() != ("com.koko.harborcity", code, version):
        raise SystemExit("APK package/version does not match project")
    digest = hashlib.sha256(data).hexdigest()
    filename = "Harbor-City-Android-debug.apk"
    tag = "v" + version
    manifest = dict(version=version, filename=filename, bytes=len(data), sha256=digest,
                    url="https://github.com/" + REPO + "/releases/download/" + tag + "/" + filename)
    print(json.dumps(manifest, indent=2), flush=True)
    if args.check_only:
        print("Verification passed. No remote changes.")
        return
    if run(["git", "status", "--porcelain"]):
        raise SystemExit("Commit the tested source and page changes first; working tree must be clean")
    if run(["git", "branch", "--show-current"]) != "main":
        raise SystemExit("Publish from main")
    run(["gh", "auth", "status"])
    run(["git", "push", "origin", "main"])
    existing = subprocess.run(["gh", "release", "view", tag, "--repo", REPO, "--json", "isDraft,url"],
                              cwd=ROOT, capture_output=True, text=True)
    if existing.returncode == 0 and not json.loads(existing.stdout)["isDraft"]:
        raise SystemExit("This version is already published. Increase the version for a new release.")
    tag_exists = subprocess.run(["git", "rev-parse", "--verify", "refs/tags/" + tag],
                                cwd=ROOT, capture_output=True).returncode == 0
    if not tag_exists:
        run(["git", "tag", tag])
    if run(["git", "rev-list", "-n", "1", tag]) != run(["git", "rev-parse", "HEAD"]):
        raise SystemExit("Existing version tag points at different source")
    run(["git", "push", "origin", tag])
    if existing.returncode != 0:
        run(["gh", "release", "create", tag, "--repo", REPO, "--verify-tag", "--draft",
             "--title", "Chit Chat City " + version, "--notes-file", notes])
    # Freeze a local copy so another build cannot replace the file mid-upload.
    with tempfile.TemporaryDirectory(prefix="harbor-release-") as folder:
        folder = Path(folder)
        (folder / filename).write_bytes(data)
        (folder / "SHA256SUMS.txt").write_text(digest + "  " + filename + "\n")
        (folder / "release.json").write_text(json.dumps(manifest, indent=2) + "\n")
        run(["gh", "release", "upload", tag, "--repo", REPO, "--clobber",
             folder / filename, folder / "SHA256SUMS.txt", folder / "release.json"])
    run(["gh", "release", "edit", tag, "--repo", REPO, "--draft=false", "--latest"])
    (ROOT / "site/release.json").write_text(json.dumps(manifest, indent=2) + "\n")
    run(["git", "add", "site/release.json"])
    if run(["git", "diff", "--cached", "--name-only"]):
        run(["git", "commit", "-m", "Update download page to " + tag])
        run(["git", "push", "origin", "main"])
    # Verify the uploaded binary bytes, rather than only the release label.
    with tempfile.TemporaryDirectory(prefix="harbor-verify-") as folder:
        run(["gh", "release", "download", tag, "--repo", REPO, "--pattern", filename, "--dir", folder])
        if hashlib.sha256((Path(folder) / filename).read_bytes()).hexdigest() != digest:
            raise SystemExit("Remote release checksum mismatch")
    print("Published and verified: https://github.com/" + REPO + "/releases/tag/" + tag)
    print("Download page: https://kokolo2020.github.io/GTA2027/")
    print("Check the Publish download page workflow if site/release.json changed.")

if __name__ == "__main__":
    main()
