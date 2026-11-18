#!/usr/bin/env python3
"""Make game/map/join_qr.png: a QR code (version 3, error correction L, byte mode) for the
browser version. No third-party QR library needed; only Pillow for writing the PNG.

    python3 scripts/make_qr.py [url]
"""
import sys
from PIL import Image

URL = sys.argv[1] if len(sys.argv) > 1 else "https://kokolo2020.github.io/GTA2027/play/?join=1"
OUT = "game/map/join_qr.png"
# Version 3-L (29x29) instead of 4-M (33x33): fewer, bigger squares at the same size on screen,
# easier to scan from a livestream. Screens are clean, so low error correction is enough.
VERSION, SIZE = 3, 29
DATA_CW, BLOCKS, EC_CW = 55, 1, 15  # version 3-L: 1 block of 55 data + 15 EC codewords
ECL_BITS = 1  # L
ALIGN = 22
MASK = 0


def gf_mul(x, y):
    z = 0
    for i in reversed(range(8)):
        z = (z << 1) ^ ((z >> 7) * 0x11D)
        z ^= ((y >> i) & 1) * x
    return z


def rs_divisor(degree):
    result = [0] * (degree - 1) + [1]
    root = 1
    for _ in range(degree):
        for j in range(degree):
            result[j] = gf_mul(result[j], root)
            if j + 1 < len(result):
                result[j] ^= result[j + 1]
        root = gf_mul(root, 2)
    return result


def rs_remainder(data, divisor):
    result = [0] * len(divisor)
    for b in data:
        factor = b ^ result.pop(0)
        result.append(0)
        for i, coef in enumerate(divisor):
            result[i] ^= gf_mul(coef, factor)
    return result


def codewords(text):
    data = text.encode("utf-8")
    assert len(data) <= DATA_CW - 2, "URL too long for version 3-L"
    bits = []
    def put(v, n):
        bits.extend((v >> i) & 1 for i in reversed(range(n)))
    put(0b0100, 4)
    put(len(data), 8)
    for b in data:
        put(b, 8)
    cap = DATA_CW * 8
    put(0, min(4, cap - len(bits)))
    put(0, (-len(bits)) % 8)
    pad = 0xEC
    while len(bits) < cap:
        put(pad, 8)
        pad ^= 0xEC ^ 0x11
    raw = [int("".join(map(str, bits[i:i + 8])), 2) for i in range(0, cap, 8)]
    per = DATA_CW // BLOCKS
    blocks = [raw[k * per:(k + 1) * per] for k in range(BLOCKS)]
    div = rs_divisor(EC_CW)
    ecs = [rs_remainder(b, div) for b in blocks]
    out = []
    for i in range(per):
        for b in blocks:
            out.append(b[i])
    for i in range(EC_CW):
        for e in ecs:
            out.append(e[i])
    return out


def build(text):
    mod = [[False] * SIZE for _ in range(SIZE)]
    fn = [[False] * SIZE for _ in range(SIZE)]

    def setf(x, y, dark):
        mod[y][x] = dark
        fn[y][x] = True

    for i in range(SIZE):
        setf(6, i, i % 2 == 0)
        setf(i, 6, i % 2 == 0)
    for cx, cy in ((3, 3), (SIZE - 4, 3), (3, SIZE - 4)):
        for dy in range(-4, 5):
            for dx in range(-4, 5):
                x, y = cx + dx, cy + dy
                if 0 <= x < SIZE and 0 <= y < SIZE:
                    setf(x, y, max(abs(dx), abs(dy)) not in (2, 4))
    for dy in range(-2, 3):  # the single alignment pattern (versions 2-6)
        for dx in range(-2, 3):
            setf(ALIGN + dx, ALIGN + dy, max(abs(dx), abs(dy)) != 1)

    def format_bits(mask):
        data = ECL_BITS << 3 | mask
        rem = data
        for _ in range(10):
            rem = (rem << 1) ^ ((rem >> 9) * 0x537)
        bits = (data << 10 | rem) ^ 0x5412
        g = lambda i: (bits >> i) & 1 == 1
        for i in range(6):
            setf(8, i, g(i))
        setf(8, 7, g(6))
        setf(8, 8, g(7))
        setf(7, 8, g(8))
        for i in range(9, 15):
            setf(14 - i, 8, g(i))
        for i in range(8):
            setf(SIZE - 1 - i, 8, g(i))
        for i in range(8, 15):
            setf(8, SIZE - 15 + i, g(i))
        setf(8, SIZE - 8, True)

    format_bits(0)  # reserve the areas
    cw = codewords(text)
    i = 0
    right = SIZE - 1
    while right >= 1:
        if right == 6:
            right = 5
        for vert in range(SIZE):
            for j in range(2):
                x = right - j
                upward = ((right + 1) & 2) == 0
                y = SIZE - 1 - vert if upward else vert
                if not fn[y][x] and i < len(cw) * 8:
                    mod[y][x] = (cw[i >> 3] >> (7 - (i & 7))) & 1 == 1
                    i += 1
        right -= 2
    for y in range(SIZE):
        for x in range(SIZE):
            if not fn[y][x] and (x + y) % 2 == 0:  # mask 0
                mod[y][x] = not mod[y][x]
    format_bits(MASK)
    return mod


def main():
    mod = build(URL)
    quiet, scale = 2, 8  # the white card in the game adds more quiet space around it
    n = (SIZE + quiet * 2) * scale
    img = Image.new("L", (n, n), 255)
    px = img.load()
    for y in range(SIZE):
        for x in range(SIZE):
            if mod[y][x]:
                for yy in range(scale):
                    for xx in range(scale):
                        px[(x + quiet) * scale + xx, (y + quiet) * scale + yy] = 0
    img.save(OUT)
    print(OUT, URL)


if __name__ == "__main__":
    main()
