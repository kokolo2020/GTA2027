# World Biosphere entrance collision fix

Status: Koko authorized publication as 0.54.4 / code 95. Release preparation in progress.

The gate was already open. The hub and dome floor cylinders ended 14 cm above the surrounding ground. Moving the player capsule into that vertical edge stopped it, so buying a pass or removing a gate could not solve the problem.

Short solid ramps now connect the ground to the main hub entrance, seven hub/spoke junctions and seven dome entrances. Antarctica ice floes have a continuous sloping ice edge for approaches from any direction. The South America canopy lookout disc is lowered 15 cm so its top matches the bridge.

Regression coverage moves the complete player capsule through the hub, every dome and the canopy, in both directions at walking, running and hoverboard speeds. Traversing Antarctica crosses its ice floes. These checks run in both the focused World Biosphere check and the full city smoke test, with an external timeout and byte-for-byte save restoration. They check movement completion and floor height; the previous point probes could not detect a lip below them.

Keep original character models, saves, level 7 access, Galleria location and free-entry policy. Koko requested publication after reviewing the distinct dome and layer designs.

The later visual refinement also adds viewing terraces. Actual movement checks cover their ramp/landing junctions and the rainforest canopy branch as well as the original entrances.
