# Harbor City leaf textures (v0.39): draws the leaf-cluster images used on tree crowns.
# Run:  python3 blender-src/make_leaf_textures.py   (needs Pillow). Writes game/models/tex/leaf_*.png.
# Each image is a cluster of many small leaves (or blossoms) on a transparent background, densest in
# the middle and ragged at the edge, so crossed cards of it read as natural foliage.
import math, os, random
from pathlib import Path
from PIL import Image, ImageDraw, ImageFilter

OUT = Path(__file__).resolve().parents[1] / "game" / "models" / "tex"
OUT.mkdir(parents=True, exist_ok=True)
S = 512

def hexc(h, a=255):
    return (int(h[0:2], 16), int(h[2:4], 16), int(h[4:6], 16), a)

def shade(c, f):
    return tuple(max(0, min(255, int(v * f))) for v in c[:3]) + (c[3],)

def leaf_poly(cx, cy, L, W, ang, lobes=0):
    pts = []
    n = 18
    for k in range(n + 1):
        t = k / n
        # Pointed oval along the leaf's axis, optional lobes (maple).
        w = W * math.sin(math.pi * t) ** 0.8
        if lobes:
            w *= 0.75 + 0.45 * abs(math.sin(t * math.pi * lobes))
        pts.append((t * L - L / 2, w))
    pts += [(x, -y) for (x, y) in reversed(pts)]
    ca, sa = math.cos(ang), math.sin(ang)
    return [(cx + x * ca - y * sa, cy + x * sa + y * ca) for (x, y) in pts]

def cluster(name, palette, n, size, lobes=0, blossoms=None, seed=1, flat=False):
    rng = random.Random(seed)
    im = Image.new("RGBA", (S, S), (0, 0, 0, 0))
    d = ImageDraw.Draw(im)
    items = []
    for k in range(n):
        r = (rng.random() ** 0.6) * S * 0.44
        a = rng.uniform(0, 2 * math.pi)
        cx = S / 2 + math.cos(a) * r
        cy = S / 2 + math.sin(a) * r * (0.55 if flat else 1.0)
        items.append((cy, cx, r))
    items.sort()
    for cy, cx, r in items:
        # Leaves near the top of the cluster are lit, lower and inner ones darker.
        light = 1.15 - 0.45 * (cy / S) - 0.15 * (1 - r / (S * 0.44))
        col = shade(hexc(rng.choice(palette)), light * rng.uniform(0.9, 1.08))
        L = size * rng.uniform(0.8, 1.25)
        poly = leaf_poly(cx, cy, L, L * (0.42 if not lobes else 0.5), rng.uniform(0, 2 * math.pi), lobes)
        d.polygon(poly, fill=col, outline=shade(col, 0.7))
    if blossoms:
        for k in range(int(n * 2.2)):
            r = (rng.random() ** 0.5) * S * 0.42
            a = rng.uniform(0, 2 * math.pi)
            cx, cy = S / 2 + math.cos(a) * r, S / 2 + math.sin(a) * r
            col = hexc(rng.choice(blossoms))
            pr = size * rng.uniform(0.18, 0.26)
            for p in range(5):
                pa = p * 2 * math.pi / 5 + rng.uniform(0, 1)
                px, py = cx + math.cos(pa) * pr, cy + math.sin(pa) * pr
                d.ellipse((px - pr, py - pr, px + pr, py + pr), fill=shade(col, rng.uniform(0.92, 1.05)))
            d.ellipse((cx - pr * 0.45, cy - pr * 0.45, cx + pr * 0.45, cy + pr * 0.45), fill=hexc("f6d36a"))
    # Clean, slightly soft edges; the game cuts the alpha at 0.4.
    im = im.filter(ImageFilter.SMOOTH)
    im = im.resize((256, 256), Image.LANCZOS)
    im.save(OUT / ("leaf_%s.png" % name))
    print("wrote", name)

cluster("green", ["3f7a3a", "4f8a40", "5f9a48", "36703a", "6aa850"], 260, 46, seed=3)
cluster("maple", ["c8452a", "e8762a", "f2a83a", "b3301e", "f6c040", "d85a2a"], 220, 52, lobes=3, seed=5)
cluster("cherry", ["6a9a4a", "7aaa55"], 70, 40, blossoms=["f8c4dc", "f4b0cc", "fde2ee", "ffffff", "eda0c4"], seed=7)
cluster("acacia", ["6f8a32", "7f9a3a", "5f7a2e", "8aa645"], 420, 22, seed=9, flat=True)
