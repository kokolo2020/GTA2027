#!/usr/bin/env python3
"""One final full regression run (includes Biosphere once), with a deadline and save restore."""
from pathlib import Path
import os,subprocess,time,signal,sys
ROOT=Path(__file__).resolve().parents[3]
GODOT=Path.home()/'harbor-city/tools/Godot.app/Contents/MacOS/Godot'
SAVE=Path.home()/'Library/Application Support/Godot/app_userdata/Harbor City/harbor_save.cfg'
if subprocess.run(['pgrep','-x','Godot'],capture_output=True).returncode==0:raise SystemExit('Another Godot instance is running')
original=SAVE.read_bytes() if SAVE.exists() else None
backup=Path.home()/'.cache/harbor-city-world-biosphere/0551-original-save.cfg';backup.parent.mkdir(parents=True,exist_ok=True)
if original is not None:backup.write_bytes(original)
steps=[('import',['--headless','--editor','--import','--quit'],None,180),('smoke',['--headless','--','--smoke-test'],'HARBOR_SMOKE_OK',900)]
if '--focused' in sys.argv:steps=[('focused',['--headless','--','--world-bio-check'],'WORLD_BIOSPHERE_OK',900)]
try:
 for name,args,marker,seconds in steps:
  path=Path('/tmp')/('wb0551-'+name+'.log');print('Starting '+name,flush=True)
  with path.open('w') as output:
   process=subprocess.Popen([str(GODOT),'--path',str(ROOT/'game'),*args],stdout=output,stderr=subprocess.STDOUT,start_new_session=True)
   deadline=time.monotonic()+seconds
   try:
    while process.poll() is None:
     text=path.read_text()
     if any(x in text for x in ['SCRIPT ERROR','Parse Error','SHADER ERROR']) or time.monotonic()>deadline:raise RuntimeError('Failed/timed out '+str(path))
     time.sleep(.2)
   finally:
    if process.poll() is None:os.killpg(process.pid,signal.SIGTERM);process.wait(timeout=10)
  text=path.read_text();assert process.returncode==0 and (marker is None or marker in text),text[-1500:]
  print('Passed '+name,flush=True)
finally:
 if original is not None:SAVE.write_bytes(original)
 elif SAVE.exists():SAVE.unlink()
 assert (SAVE.read_bytes() if SAVE.exists() else None)==original
 print('Desktop save restored byte for byte.',flush=True)
