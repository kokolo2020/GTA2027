# Koko's decisions: preserve these

Copied from the old handover (valid at 0.55.2) plus later changes. Newest changes first.

## Later changes
- 0.55.4 (Koko's request): an open, roofless, ground-level ring loop (RING_R=72) joins the domes. This REVERSES decision 1's 'no circular connector' for the loop only. Pathways stay unroofed; dome glass roofs remain.
- 0.55.5: invisible car-only fence (BIO_CAR_FENCE_R=168) round the campus; rails along the loop; do NOT widen _people_only to the campus disc (breaks the v0.41 bollard smoke test).
- 0.55.6: hub wall is solid except 8 doors (south entry + 7 dome axes); dome entrances have name sign boards; visitors walk the paths; entering a dome auto-starts its next quest and the HUD points to the marker.

## Original list (0.55.2)
1. **Open hub-and-seven-spoke layout. No pathway roofs and no circular connector.** The enclosed ring in 0.55.1 was explicitly rejected after Fold5 screenshots. Do not restore it when reusing older code. Dome glass roofs remain.
2. **Every dome is sealed; only its door allows entry/exit.** Continuous lower perimeter collision leaves exactly one 5.6 m doorway; upper glass has solid collision too. Open outside paths create no additional dome openings.
3. Free entry: **no tickets, day passes or closed gates**. Existing level-7 unlock remains.
4. Smooth rim bevels, shared ramp joins and continuous rails; no raised lips, gaps or rail pieces across visitor paths. All seven landscapes, routes and stages must retain distinct designs.
5. Large hub directions list left Oceania/North America/Europe, straight Africa, right Asia/South America/Antarctica. Each dome door has neighboring left/right dome signs when facing the hub.
6. **Daily Keeper progress validates automatically by proximity** at the yellow markers, including BOARD. No click or manual prompt. Keep once-per-day payouts, saved steps, streaks and achievements.
7. Preserve all 46 existing species identities/`bio_seen` bits and passport progress; append future species. Keep the third Phase 2 slot named **Oceania**, with Australian wildlife. No character redesign: original characters remain after the earlier rollback.
8. Retain pen clearance, solid raised guards and pen/stuck-player rescue. Flamingos wade only; standing birds use supported ground/perches. Only proper spread-wing models fly. Elephant GLBs load, hips meet torso, and feeding slots are separated. Animals remain stylized original assets; no photorealism claim.
9. Keep only the active dome's detail/models resident; unload/free the previous detail. Preserve mobile-lite Android rendering, alpha-scissor foliage, opaque rails and distant animation throttling. Maintain the 5% FPS budget.

