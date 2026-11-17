"""Refresh the website download payload after a successful APK export."""
from pathlib import Path
import hashlib
import json
import shutil
import zipfile

root = Path(__file__).resolve().parents[1]
dist = root / "download-site" / "dist"
apk = root / "builds" / "Harbor-City-Android-debug.apk"
data = apk.read_bytes()
with zipfile.ZipFile(apk) as archive:
    assert archive.testzip() is None, "APK archive is damaged"
parts = []
for index, start in enumerate(range(0, len(data), 10 * 1024 * 1024), 1):
    name = f"assets/harbor-city.part{index}"
    (dist / name).write_bytes(data[start:start + 10 * 1024 * 1024])
    parts.append(name)
assert b"".join((dist / name).read_bytes() for name in parts) == data
preset = (root / "game" / "export_presets.cfg").read_text()
version = next(line.split('"')[1] for line in preset.splitlines() if line.startswith("version/name="))
manifest = dict(filename=apk.name, bytes=len(data), sha256=hashlib.sha256(data).hexdigest(), parts=parts, version=version)
(dist / "download.json").write_text(json.dumps(manifest, indent=2) + "\n")
screenshot = root / "builds" / "harbor-city-gameplay.png"
if screenshot.exists():
    shutil.copyfile(screenshot, dist / "assets" / "gameplay.png")
print(json.dumps(manifest))
