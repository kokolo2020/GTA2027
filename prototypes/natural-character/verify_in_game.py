"""Run local checks serially and restore the desktop save even after a failure."""
import hashlib, os, subprocess, sys, time
from pathlib import Path

ROOT=Path(__file__).resolve().parents[2]
GODOT=Path.home()/'harbor-city/tools/Godot.app/Contents/MacOS/Godot'
SAVE=Path.home()/'Library/Application Support/Godot/app_userdata/Harbor City/harbor_save.cfg'
if subprocess.run(['pgrep','-x','Godot'],capture_output=True).returncode==0:
    raise SystemExit('Another Godot instance is open; no game or test was started.')
original=SAVE.read_bytes() if SAVE.exists() else None
backup=Path.home()/'.cache/harbor-city-character-trial/harbor_save.cfg'
backup.parent.mkdir(parents=True,exist_ok=True)
if original is not None:backup.write_bytes(original)
env=os.environ.copy()
try:
    steps=[
        ('import',['--headless','--path',str(ROOT/'game'),'--editor','--import','--quit'],120),
        ('character-check',['--headless','--path',str(ROOT/'game'),'--','--natural-player-check'],120),
        ('smoke',['--headless','--path',str(ROOT/'game'),'--','--smoke-test'],180),
    ]
    if '--visual' in sys.argv:
        env['HC_CHARACTER_SHOTS']=str(Path(__file__).resolve().parent/'in-game')
        steps=[('visual',['--path',str(ROOT/'game'),'--','--natural-player-check'],120),
               ('rollback',['--headless','--path',str(ROOT/'game'),'--','--natural-player-check','--classic-player'],120)]
    if '--bench' in sys.argv:
        env['HC_BENCH_AT']='-17,-6,0'
        steps=[('import',['--headless','--path',str(ROOT/'game'),'--editor','--import','--quit'],120),
               ('bench',['--path',str(ROOT/'game'),'--','--bench','--web-lite'],120)]
        if '--classic-city' in sys.argv:
            steps[-1]=('bench-classic',['--path',str(ROOT/'game'),'--','--bench','--web-lite','--classic-city'],120)
    for label,args,limit in steps:
        log=Path('/tmp')/('harbor-trial-'+label+'.log')
        print('Starting',label,flush=True)
        with log.open('w') as output:
            process=subprocess.Popen([str(GODOT),*args],stdout=output,stderr=subprocess.STDOUT,env=env)
            deadline=time.monotonic()+limit
            try:
                while process.poll() is None:
                    if any(marker in log.read_text() for marker in ['SCRIPT ERROR','SHADER ERROR','Shader compilation failed']) or time.monotonic()>deadline:
                        raise SystemExit('Stopped failed/timed-out '+label+'; see '+str(log))
                    time.sleep(.2)
            finally:
                if process.poll() is None:
                    process.terminate()
                    try:process.wait(timeout=5)
                    except subprocess.TimeoutExpired:process.kill();process.wait()
        text=log.read_text()
        if process.returncode or any(marker in text for marker in ['SCRIPT ERROR','Parse Error','SHADER ERROR','Shader compilation failed']):
            raise SystemExit('Failed '+label+'; see '+str(log))
        if label=='character-check' and 'HARBOR_NATURAL_PLAYER_OK' not in text:
            raise SystemExit('Character check did not complete; see '+str(log))
        if label=='smoke' and 'HARBOR_SMOKE_OK' not in text:
            raise SystemExit('Smoke test did not complete; see '+str(log))
        if label=='visual' and 'HARBOR_NATURAL_PLAYER_SHOTS_OK' not in text:
            raise SystemExit('Visual check did not complete; see '+str(log))
        if label=='rollback' and 'HARBOR_CLASSIC_PLAYER_OK' not in text:
            raise SystemExit('Classic rollback check did not complete; see '+str(log))
        if label.startswith('bench') and 'HC_BENCH fps=' not in text:
            raise SystemExit('Benchmark did not complete; see '+str(log))
        print('Passed',label,flush=True)
finally:
    if original is not None:SAVE.write_bytes(original)
    elif SAVE.exists():SAVE.unlink()
    restored=SAVE.read_bytes() if SAVE.exists() else None
    assert restored==original
    print('Desktop save restored byte for byte.',flush=True)
