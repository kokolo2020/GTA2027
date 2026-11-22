# Phase 2 animal refinement — unreleased 0.55.0

Koko rejected the rounded, toy-like Phase 2 animals. Replaced all 13 new species with original species-specific game models, keeping filenames, species indices and passport/save identities intact. No release, export preset or site change.

## What changed

- Connected torso/neck/head anatomy, shaped jointed legs, paws, claws and cloven hooves. Skin cross-sections maintain their orientation around bent joints; shoulders and hips overlap the body throughout the stride.
- Wolf: lean chest, tucked belly, long muzzle, smaller eyes, shorter pointed ears, canine hocks and a tapered tail. Brown bear: heavy shoulder/neck, broad muzzle, rounded ears and plantigrade feet. Bison: raised withers, lower head carriage, curved horns, beard and cloven hooves.
- Kangaroo: pear-shaped hindquarters, long balancing tail, small forearms, long feet and a pouch joey. Wombat: low stocky body and short digging legs. Koala: seated pose, broad leathery nose, rounded furred ears and clawed hands. Platypus: low body, flat bill/paddle tail and webbed feet. Hedgehog: tapered face and denser fine quills.
- Species-specific bird bodies, necks, beaks, toes and feather shapes. Woodland owl facial plumage, eagle white head/neck and hooked bill, stork long neck/bill, emu coarse plumage and cockatoo crest. Resting birds have tucked wings; flying birds expose articulated spread wings. Perched koalas stay seated.
- Rough matte coats with vertex-colour variation, contrasting underparts and restrained eye/nose highlights. Godot Compatibility materials explicitly use the exported colour attributes. Colour is preserved on all exported surfaces; rare variants retain their separate appearance.
- Refined quadrupeds use diagonal leg pairs. Kangaroo hind legs move together with a small hop. Flying wings use a gentler glide cycle. Only the current Phase 2 dome animates its wildlife at up to 60 Hz; rewards, spotting and UI remain at 5 Hz. Cached per-dome animal lists avoid scanning inactive animals for every animation update.

These remain economical game models with realistic proportions and identifying features, rather than photorealistic scanned animals. Anatomy uses a remeshed continuous core and shaped lofted limbs; there are no fur particle systems or external textures/assets.

## Files and previews

`blender-src/animals_phase2.py` is called by the existing `make_animals.py` generator. Use `HARBOR_PHASE2_ANIMALS_ONLY=1`; optionally `HARBOR_PHASE2_KIND=wolf` selects one species. `HARBOR_REFINED_PREVIEWS=<directory>` renders native Blender previews. `HARBOR_PROJECT_ROOT=<temporary directory>` generates outside the checkout for iteration.

This folder has a neutral render of each new species and the original in-game wolf/bison/kangaroo screenshots (`before-*.png`). Updated actual game screenshots are in the adjacent `../shots/` folder, including close wildlife views for all three continents. Blender previews and in-game screenshots use different lighting; final colours are checked in the game.

## Validation

Guarded import, focused checks and full smoke cover access, real-body walking/running/BOARD, all 21 quests, rewards once, passport completion, all new photo targets, rare encounters, daily streaks, co-op and save round-trip. Additional checks exercise folded/flying wing visibility, wolf diagonal gait, synchronized kangaroo legs, smooth motion between reward ticks and the coat-material colour flag. Desktop saves are restored byte for byte by the runner. Final native Web-lite benchmark results and screenshot review are recorded below. No phone validation or release performed.
