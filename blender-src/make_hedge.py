# Chit Chat City v0.58: leafy path hedges that match the Biosphere trees (same leaf cards and shading),
# plus a second shape for variety. Light enough to draw hundreds: about 400 triangles each.
# Run headless:  Blender -b --factory-startup -P blender-src/make_hedge.py
import os
from pathlib import Path
_ROOT = Path(os.environ.get("HARBOR_PROJECT_ROOT", Path(__file__).resolve().parents[1])).resolve()
_src = (_ROOT / "blender-src/make_nature.py").read_text()
exec(_src.split("for o in list(bpy.data.objects):")[0])   # helpers only (Builder, mat, card_mat, rnd_dir)

for o in list(bpy.data.objects):
    bpy.data.objects.remove(o, do_unlink=True)

def hedge(name, seed, leaves, flowers, wide=1.0, tall=1.0):
    rng = random.Random(seed)
    mats = [mat("Bark_5a4030", "5a4030")] + [mat("Leaf_%s" % h, h, 0.9) for h in leaves[:2]] + [card_mat("green")] + [mat("Flower_%s" % h, h, 0.6) for h in flowers]
    B = Builder(mats)
    centre = Vector((0, 0, 0.42 * tall))
    # a dark leafy core so no ground shows through
    for k in range(3):
        a = 2 * math.pi * k / 3 + rng.uniform(-0.4, 0.4)
        r = 0.2 * wide
        B.blob(Vector((math.cos(a) * r, math.sin(a) * r, rng.uniform(0.3, 0.42) * tall)), rng.uniform(0.34, 0.42) * wide, 1 + k % 2, squash=0.85 * tall, lump=0.3, subdiv=1, seed=rng.uniform(0, 40))
    # crossed leaf cards all round it, lit as one rounded mound (the same trick as the tree crowns)
    for k in range(18):
        d = rnd_dir(rng)
        d.z = abs(d.z) * 0.9 + 0.05
        d.normalize()
        q = centre + Vector((d.x * 0.5 * wide, d.y * 0.5 * wide, d.z * 0.42 * tall - 0.05))
        light_n = (d * 0.75 + Vector((0, 0, 0.55))).normalized()
        nrm = (rnd_dir(rng) + Vector((0, 0, 0.5))).normalized()
        B.card(q, rng.uniform(0.62, 0.8) * wide, nrm, 3, rng.uniform(0, 6.28), light_n)
    # a few blossoms sitting in the leaves
    for k in range(7):
        d = rnd_dir(rng)
        d.z = abs(d.z) * 0.8 + 0.2
        d.normalize()
        q = centre + Vector((d.x * 0.5 * wide, d.y * 0.5 * wide, d.z * 0.5 * tall))
        B.blob(q, rng.uniform(0.055, 0.08), 4 + rng.randrange(len(flowers)), squash=1.0, lump=0.1, subdiv=0)
    B.export(name)

hedge("nature_hedge", 211, ["2a5a34", "3a7040"], ["ff7ab8", "ffffff", "ffd23f", "c254ff", "ff8a1c"])
hedge("nature_hedge2", 223, ["2a5a34", "3a7040"], ["ffd23f", "ffffff", "ff8a1c"], wide=1.12, tall=0.9)
print("HEDGE DONE")
