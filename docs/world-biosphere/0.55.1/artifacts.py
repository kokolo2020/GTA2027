#!/usr/bin/env python3
"""Guarded serial screenshots, map bake and release exports; preserves the local save."""
from pathlib import Path
import os, subprocess, time, signal
ROOT=Path(__file__).resolve().parents[3]
GODOT=Path.home()/'harbor-city/tools/Godot.app/Contents/MacOS/Godot'
SAVE=Path.home()/'Library/Application Support/Godot/app_userdata/Harbor City/harbor_save.cfg'
if subprocess.run(['pgrep','-x','Godot'],capture_output=True).returncode==0:raise SystemExit('Another Godot instance is running')
original=SAVE.read_bytes() if SAVE.exists() else None
env=os.environ.copy()
env['HC_SHOTS']=str(Path(__file__).parent/'shots')
env['JAVA_HOME']=str(Path.home()/'harbor-city/tools/jdk17/jdk-17.0.21+9/Contents/Home')
env['ANDROID_HOME']=str(Path.home()/'harbor-city/tools/android-sdk')
steps=[('shots',['--resolution','1280x720','--','--world-bio-shots'],'WORLD_BIOSPHERE_SHOTS_OK',240),('map',['--resolution','1024x1024','--','--bake-map'],None,180),('map-import',['--headless','--editor','--import','--quit'],None,180),('android',['--headless','--export-debug','Android','../builds/Harbor-City-Android-debug.apk'],None,300),('web',['--headless','--export-release','Web','../site/play/index.html'],None,300)]
try:
 for name,args,marker,seconds in steps:
  path=Path('/tmp')/('wb0551-'+name+'.log');print('Starting '+name,flush=True)
  with path.open('w') as output:
   process=subprocess.Popen([str(GODOT),'--path',str(ROOT/'game'),*args],env=env,stdout=output,stderr=subprocess.STDOUT,start_new_session=True)
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
 (ROOT/'builds/Harbor-City-Android-debug.apk.idsig').unlink(missing_ok=True)
finally:
 if original is not None:SAVE.write_bytes(original)
 elif SAVE.exists():SAVE.unlink()
 assert (SAVE.read_bytes() if SAVE.exists() else None)==original
 print('Desktop save restored byte for byte.',flush=True)
