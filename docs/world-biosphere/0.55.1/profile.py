#!/usr/bin/env python3
"""Serial native --bench --web-lite profile, guarded; restore player save bytes."""
from pathlib import Path
import os,subprocess,time,signal,json,re,sys,math
ROOT=Path(__file__).resolve().parents[3]
GODOT=Path.home()/'harbor-city/tools/Godot.app/Contents/MacOS/Godot'
SAVE=Path.home()/'Library/Application Support/Godot/app_userdata/Harbor City/harbor_save.cfg'
if subprocess.run(['pgrep','-x','Godot'],capture_output=True).returncode==0:raise SystemExit('Godot already running')
original=SAVE.read_bytes() if SAVE.exists() else None
label=sys.argv[1];results=[]
coords=[('downtown',-17,-6)] if '--downtown' in sys.argv else [(name,-860+math.cos(-math.pi/2+i*math.tau/7)*115,-650+math.sin(-math.pi/2+i*math.tau/7)*115) for i,name in enumerate(['Africa','Asia','South America','Antarctica','Europe','North America','Oceania'])]
if "--dome" in sys.argv:coords=[coords[int(sys.argv[sys.argv.index("--dome")+1])]]
try:
 for name,x,z in coords:
  env=os.environ.copy();env['HC_BENCH_AT']=f'{x},{z},0'
  path=Path('/tmp')/f'wb0551-{label}-{name.replace(" ","-")}.log'
  with path.open('w') as output:
   process=subprocess.Popen(['/usr/bin/time','-l',str(GODOT),'--path',str(ROOT/'game'),'--','--bench','--web-lite'],env=env,stdout=output,stderr=subprocess.STDOUT,start_new_session=True)
   deadline=time.monotonic()+120
   try:
    while process.poll() is None:
     text=path.read_text()
     if any(x in text for x in ['SCRIPT ERROR','Parse Error','SHADER ERROR']) or time.monotonic()>deadline:raise RuntimeError('Profile failed: '+str(path))
     time.sleep(.2)
   finally:
    if process.poll() is None:
     os.killpg(process.pid,signal.SIGTERM);process.wait(timeout=10)
  text=path.read_text();assert process.returncode==0 and 'HC_BENCH fps=' in text,text[-1500:]
  profile=json.loads(next(line.removeprefix('WB_PROFILE ') for line in text.splitlines() if line.startswith('WB_PROFILE ')))
  bench=next(line for line in text.splitlines() if line.startswith('HC_BENCH'))
  profile.update(name=name,bench=bench,rss_peak_bytes=int(re.search(r'(\d+)\s+maximum resident set size',text)[1]),fps=float(re.search(r'fps=([\d.]+)',bench)[1]),footprint_peak_bytes=int(re.search(r'(\d+)\s+peak memory footprint',text)[1]) if 'peak memory footprint' in text else None)
  results.append(profile);print(name,profile['fps'],'FPS; peak RSS',round(profile['rss_peak_bytes']/1048576,1),'MiB; tick',round(profile['tick_us_avg'],1),'us',flush=True)
  if original is not None:SAVE.write_bytes(original)
  elif SAVE.exists():SAVE.unlink()
finally:
 if original is not None:SAVE.write_bytes(original)
 elif SAVE.exists():SAVE.unlink()
 assert (SAVE.read_bytes() if SAVE.exists() else None)==original
 (Path(__file__).parent/(label+'.json')).write_text(json.dumps(results,indent=2))
 print('Desktop save restored byte for byte.',flush=True)
