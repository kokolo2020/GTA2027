#!/usr/bin/env python3
"""Serial World Biosphere checks with process deadlines and byte-for-byte save restoration."""
from pathlib import Path
import os, subprocess, sys, time
ROOT=Path(__file__).resolve().parents[1]
GODOT=Path.home()/'harbor-city/tools/Godot.app/Contents/MacOS/Godot'
SAVE=Path.home()/'Library/Application Support/Godot/app_userdata/Harbor City/harbor_save.cfg'
if subprocess.run(['pgrep','-x','Godot'],capture_output=True).returncode==0:
    raise SystemExit('Another Godot instance is running; no checks started.')
original=SAVE.read_bytes() if SAVE.exists() else None
backup=Path.home()/'.cache/harbor-city-world-biosphere/save.cfg'
backup.parent.mkdir(parents=True,exist_ok=True)
if original is not None:backup.write_bytes(original)
env=os.environ.copy()
steps=[('import',['--headless','--editor','--import','--quit'],None,120),
       ('check',['--headless','--','--world-bio-check'],'WORLD_BIOSPHERE_OK',180)]
if '--smoke' in sys.argv:steps.append(('smoke',['--headless','--','--smoke-test'],'HARBOR_SMOKE_OK',240))
if '--shots' in sys.argv:
    steps=[('shots',['--resolution','1280x720','--','--world-bio-shots'],'WORLD_BIOSPHERE_SHOTS_OK',150)]
    env['HC_SHOTS']=str(ROOT/('docs/world-biosphere/phase2/shots' if '--phase2' in sys.argv else 'docs/world-biosphere/shots'))
if '--map' in sys.argv:steps=[('map',['--resolution','1024x1024','--','--bake-map'],None,150)]
if '--bench' in sys.argv:
    at=sys.argv[sys.argv.index('--bench')+1] if len(sys.argv)>sys.argv.index('--bench')+1 else '-17,-6,0'
    env['HC_BENCH_AT']=at
    steps=[('bench-'+at.replace(',','_'),['--','--bench','--web-lite'],'HC_BENCH fps=',120)]
try:
 for name,args,marker,limit in steps:
    print('Starting '+name,flush=True)
    log=Path('/tmp')/('world-biosphere-'+name+'.log')
    with log.open('w') as out:
      process=subprocess.Popen([str(GODOT),'--path',str(ROOT/'game'),*args],stdout=out,stderr=subprocess.STDOUT,env=env)
      deadline=time.monotonic()+limit
      try:
       while process.poll() is None:
        data=log.read_text()
        if any(x in data for x in ['SCRIPT ERROR','Parse Error','SHADER ERROR','Shader compilation failed']) or time.monotonic()>deadline:
         raise RuntimeError('Failed/timed out '+name+'; see '+str(log))
        time.sleep(.2)
      finally:
       if process.poll() is None:
        process.terminate()
        try:process.wait(timeout=5)
        except subprocess.TimeoutExpired:process.kill();process.wait()
    data=log.read_text()
    if process.returncode or any(x in data for x in ['SCRIPT ERROR','Parse Error','SHADER ERROR']) or (marker and marker not in data):
      raise RuntimeError('Check failed '+name+'; see '+str(log))
    print('Passed '+name,flush=True)
    if name.startswith('bench'):
      print('\n'.join(x for x in data.splitlines() if 'HC_BENCH' in x),flush=True)
finally:
 if original is not None:SAVE.write_bytes(original)
 elif SAVE.exists():SAVE.unlink()
 assert (SAVE.read_bytes() if SAVE.exists() else None)==original
 print('Desktop save restored byte for byte.',flush=True)
