/datum/human_ai_squad_preset/clfreal
	faction = "CLF Remnants"

/datum/human_ai_squad_preset/clfreal/patrol
	name = "CLF Insurgents, Patrol"
	desc = "CLF raiding party patrol."
	ai_to_spawn = list(
		/datum/equipment_preset/clfreal/soldier = 2,
	)

/datum/human_ai_squad_preset/clfreal/at
	name = "CLF Insurgents, Anti-Tank Team"
	desc = "CLF dedicated anti-tank hunter team."
	ai_to_spawn = list(
		/datum/equipment_preset/clfreal/at = 1,
		/datum/equipment_preset/clfreal/soldier = 1,
	)

/datum/human_ai_squad_preset/clfreal/fortified
	name = "CLF Insurgents, Defensive Team"
	desc = "CLF checkpoint defense squad."
	ai_to_spawn = list(
		/datum/equipment_preset/clfreal/soldier = 2,
		/datum/equipment_preset/clfreal/soldier/flamer = 1,
		/datum/equipment_preset/clfreal/medic = 1,
	)

/datum/human_ai_squad_preset/clfreal/leader_escort
	name = "CLF Insurgents, Squad"
	desc = "CLF local command element."
	ai_to_spawn = list(
		/datum/equipment_preset/clfreal/soldier/leader = 1,
		/datum/equipment_preset/clfreal/soldier = 2,
		/datum/equipment_preset/clfreal/medic = 1,
	)

/datum/human_ai_squad_preset/clfreal/honor_guard
	name = "CLF Insurgents, Command Element"
	desc = "CLF cell honor guard."
	ai_to_spawn = list(
		/datum/equipment_preset/clfreal/commander = 1,
		/datum/equipment_preset/clfreal/soldier = 2,
		/datum/equipment_preset/clfreal/medic = 1,
	)
