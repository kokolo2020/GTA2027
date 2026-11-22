# World Biosphere conservatory refinement

Status: released and verified as 0.54.4 / code 95.

Koko supplied screenshots of the older Biosphere as the quality reference: lush Blender planting, triangular glass framing, elevated glass-sided terraces and large landscape features. This revision brings those elements into the continent layout:

- Existing Blender trees, shrubs, flowers, ferns and grasses retain their authored materials and are instanced under each dome interior.
- Dense triangular roof framing replaces the sparse ribs, and the opaque perimeter belt is replaced with transparent glazing over a low plinth. Different ground trails and planted borders replace the repeated cross-shaped visitor routes.
- Africa has a winding savanna trail, a straight elevated safari bridge and a shaded rectangular lookout.
- Asia has bamboo switchbacks, a curved climb and a circular terrace around a tall animated rain vortex, plus rice terraces and the original pavilion.
- South America has a river trail, a bent canopy climb, branching bridges and a square timber tree fort with an opening for its living tree, beside a tall animated cliff waterfall.
- Antarctica has a floe route with a western branch, a spiral climb around an ice mountain and a small summit platform for aurora watching.
- Europe, North America and Oceania remain later-phase conservation previews; their ground-route outlines are different (garden loop, forest switchbacks and forked island walk). Ocean World is still a Phase 3 reservation.
- Trees leave visitor paths clear; rainforest trees stay green, and Antarctica keeps snow/ice colors.
- Existing quests, passport, spotting bits, original character designs, Galleria location and level 7 access stay intact.

Only the current dome interior is shown in detail. Mist emitters stop outside their dome. Actual movement tests cover the entrances, floes, canopy and new terrace junctions in both directions at walking, running and hoverboard speeds. See ENTRY-FIX.md for the floor-rim diagnosis and fix.

Screenshots in shots/ are actual Godot renders. Performance figures are local Mac Web-lite measurements, not phone validation. Android/Web exports, Android signing/version/integrity and public APK/Web package checksums verified. Not phone-tested.

## Vertical habitat layers

Added 32 animal instances using existing species, so saved spotting bits and completed passport pages remain valid:

- Africa: 2 lions on kopje ledges, 2 meerkats on a smaller rock tier and 4 flamingos in the upper flight zone.
- Asia: 2 snow leopards on high cliffs, 2 red pandas in tree habitats and 3 cranes above the bamboo.
- South America: 3 canopy monkeys, 2 hanging sloths and 4 macaws in the upper flight zone.
- Antarctica: 3 penguins including a chick on a raised ice colony, 2 albatross at cliff nests and 3 albatross in flight.

Animal ledges have perimeter barriers; flight circuits stay contained within the continent's outer glass enclosure. Upper instances preserve their base height and are only updated inside the active dome. Screenshots named `*-layers.png` show views from the upper visitor stages.
