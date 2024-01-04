/mob/living/basic/bloodling
	name = "bloodling"
	desc = "A disgusting mass of bone and flesh. It reaches out around it with fleshy tendrils."
	icon_state = "headslug"
	icon_living = "headslug"
	icon_dead = "headslug_dead"
	mob_biotypes = MOB_ORGANIC
	speak_emote = list("spews")
	butcher_results = list(/obj/item/food/meat/slab = 2)
	response_help_continuous = "pets"
	response_help_simple = "pet"
	response_disarm_continuous = "pushes aside"
	response_disarm_simple = "push aside"
	melee_attack_cooldown = CLICK_CD_MELEE
	damage_coeff = list(BRUTE = 1, BURN = 1.25, TOX = 1, STAMINA = 1, OXY = 1)
	basic_mob_flags = FLAMMABLE_MOB
	status_flags = NONE
	sight = SEE_SELF|SEE_MOBS
	unsuitable_cold_damage = 1
	unsuitable_heat_damage = 1
	faction = list(FACTION_BLOODLING)
	pass_flags = PASSTABLE
	attack_verb_continuous = "bites"
	attack_verb_simple = "bite"
	attack_sound = 'sound/effects/attackblob.ogg'
	attack_vis_effect = ATTACK_EFFECT_BITE
	health = 100
	maxHealth = 100

	/// The abilities the bloodling has to start with
	var/static/list/abilities = list(
		/datum/action/cooldown/bloodling/hide,
	)
	// The amount of biomass our bloodling has
	var/biomass = 0
	// The maximum amount of biomass a bloodling can gain
	var/biomass_max = 500

/mob/living/basic/bloodling/Initialize(mapload)
	. = ..()
	create_abilities()
	ADD_TRAIT(src, TRAIT_VENTCRAWLER_ALWAYS, INNATE_TRAIT)
	RegisterSignal(owner, COMSIG_MOB_APPLY_DAMAGE, PROC_REF(on_damaged))

/// Checks for damage to update the bloodlings biomass accordingly
/mob/living/basic/bloodling/proc/on_damaged(datum/source, damage, damagetype)
	SIGNAL_HANDLER

	// Stamina damage is fucky, so we ignore it
	if(damagetype == STAMINA)
		return

	src.add_biomass(-damage, TRUE)

/// Used for adding biomass to the bloodling since health needs updating accordingly
/// ARGUEMENTS:
/// amount-The amount of biomass to be added or subtracted
/// damage-If the biomass addition is caused by damage, used so stuff doesnt get fucky
/mob/living/basic/bloodling/proc/add_biomass(amount, damage = FALSE)
	if(biomass > biomass_max)
		src.biomass = biomass_max
		balloon_alert(src, "already maximum biomass")
		return
	src.biomass += amount
	src.maxHealth = biomass
	if(damage)
		src.health = biomass

/// Creates the bloodlings abilities
/mob/living/basic/bloodling/proc/create_abilities()
	for (var/datum/action/cooldown/bloodling/created_action in abilities)
		created_action = created_action new(src)
		created_action.Grant(src)

