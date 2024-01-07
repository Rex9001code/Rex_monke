/datum/objective/bloodling_ascend
	name = "ascend"
	martyr_compatible = TRUE
	admin_grantable = FALSE
	explanation_text = "Ascend as the ultimate being"

/datum/objective/bloodling_ascend/check_completion()
	var/datum/antagonist/bloodling/bloodling = IS_BLOODLING(owner.current)
	if (!bloodling.is_ascended)
		return FALSE
	return TRUE

/datum/objective/bloodling_thrall
	name = "serve"
	martyr_compatible = TRUE
	admin_grantable = FALSE
	explanation_text = "Serve your master!"

/datum/objective/bloodling_thrall/update_explanation_text()
	..()
	var/datum/antagonist/infested_thrall/our_owner = owner
	if(owner.master)
		explanation_text = "Serve your master [owner.master]!"
	else
		explanation_text = "Serve your master!"
