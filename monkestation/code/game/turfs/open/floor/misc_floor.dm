/obj/item/stack/tile/sandy_dirt
	name = "sandy dirt tiles"
	singular_name = "sandy dirt tile"
	desc = "A flat tile of dirt."
	icon = 'monkestation/icons/obj/tiles.dmi'
	icon_state = "tile_sandy_dirt"
	inhand_icon_state = "tile-sepia"
	turf_type = /turf/open/floor/sandy_dirt
	merge_type = /obj/item/stack/tile/sandy_dirt

/turf/open/floor/sandy_dirt
	gender = PLURAL
	name = "dirt"
	desc = "Upon closer examination, it's still dirt."
	icon = 'icons/turf/floors.dmi'
	icon_state = "sand"
	base_icon_state = "sand"
	bullet_bounce_sound = null
	footstep = FOOTSTEP_SAND
	barefootstep = FOOTSTEP_SAND
	clawfootstep = FOOTSTEP_SAND
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY
	tiled_dirt = FALSE

	floor_tile = /obj/item/stack/tile/sandy_dirt

/turf/open/floor/sandy_dirt/break_tile()
	. = ..()
	icon_state = "sand_damaged"

// These are from https://github.com/tgstation/tgstation/pull/82933 but we dont have deathmatch so
// for the illusion of a moving train
/turf/open/chasm/true/no_smooth/fake_motion_sand
	name = "air"
	desc = "Dont jump off, unless you want to fall a really long distance."
	icon_state = "sandmoving"
	base_icon_state = "sandmoving"
	icon = 'icons/turf/floors.dmi'

/turf/open/chasm/true/no_smooth/fake_motion_sand/fast
	icon_state = "sandmovingfast"
	base_icon_state = "sandmovingfast"
