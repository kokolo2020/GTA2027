"""Serial local exports using the established Godot and Android signing configuration."""
import os, subprocess
from pathlib import Path

ROOT=Path(__file__).resolve().parents[2]
GODOT=Path.home()/'harbor-city/tools/Godot.app/Contents/MacOS/Godot'
if subprocess.run(['pgrep','-x','Godot'],capture_output=True).returncode==0:
    raise SystemExit('Another Godot instance is open; exports were not started.')
env=os.environ.copy()
env['JAVA_HOME']=str(Path.home()/'harbor-city/tools/jdk17/jdk-17.0.21+9/Contents/Home')
env['ANDROID_HOME']=str(Path.home()/'harbor-city/tools/android-sdk')
(ROOT/'builds').mkdir(exist_ok=True)
for name,args in [('android',['--export-debug','Android','../builds/Harbor-City-Android-debug.apk']),
                  ('web',['--export-release','Web','../site/play/index.html'])]:
    log=Path('/tmp')/('harbor-0.53.0-export-'+name+'.log')
    print('Exporting',name,flush=True)
    with log.open('w') as output:
        result=subprocess.run([str(GODOT),'--headless','--path',str(ROOT/'game'),*args],
                              stdout=output,stderr=subprocess.STDOUT,env=env,timeout=240)
    if result.returncode or 'SCRIPT ERROR' in log.read_text():
        raise SystemExit('Export failed; see '+str(log))
    print('Exported',name,flush=True)
idsig=ROOT/'builds/Harbor-City-Android-debug.apk.idsig'
if idsig.exists():idsig.unlink()
with Path('/tmp/harbor-0.53.0-verification.log').open('w') as output:
    subprocess.run(['python3','scripts/publish-release.py','builds/Harbor-City-Android-debug.apk',
                    '--notes','docs/releases/v0.53.0.md','--check-only'],cwd=ROOT,env=env,
                   stdout=output,stderr=subprocess.STDOUT,check=True,timeout=120)
print(Path('/tmp/harbor-0.53.0-verification.log').read_text(),flush=True)
