/datum/equipment_preset/clfreal
	name = "CLF Insurgent"
	languages = list(LANGUAGE_JAPANESE, LANGUAGE_ENGLISH)
	flags = EQUIPMENT_PRESET_EXTRA
	faction = FACTION_UA_REBEL
	faction_group = FACTION_LIST_UA_REBEL
	skills = /datum/skills/clf
	paygrades = list(PAY_SHORT_REB = JOB_PLAYTIME_TIER_0)
	origin_override = ORIGIN_CIVILIAN

/datum/equipment_preset/clfreal/New()
	. = ..()
	access = get_access(ACCESS_LIST_CLF_BASE)

/datum/equipment_preset/clfreal/load_name(mob/living/carbon/human/new_human, randomise)
	new_human.gender = pick(85;MALE, 15;FEMALE)
	new_human.skin_color = "Pale 1"
	var/random_name
	var/first_name
	var/last_name
	var/static/list/colors = list("BLACK" = list(15, 15, 10), "BLACK" = list(15, 15, 10))
	var/static/list/hair_colors = list("BLACK" = list(15, 15, 10))
	var/hair_color = pick(hair_colors)
	new_human.r_hair = hair_colors[hair_color][1]
	new_human.g_hair = hair_colors[hair_color][2]
	new_human.b_hair = hair_colors[hair_color][3]
	new_human.r_facial = hair_colors[hair_color][1]
	new_human.g_facial = hair_colors[hair_color][2]
	new_human.b_facial = hair_colors[hair_color][3]
	var/eye_color = pick(colors)
	new_human.r_eyes = colors[eye_color][1]
	new_human.g_eyes = colors[eye_color][2]
	new_human.b_eyes = colors[eye_color][3]
	//gender checks
	if(new_human.gender == MALE)
		if(prob(15))
			first_name = "[capitalize(randomly_generate_japanese_word(rand(1, 3)))]"
		else
			first_name = "[pick(GLOB.first_names_male_clf)]"
		new_human.h_style = pick("CIA", "Mulder", "Pixie Cut Left", "Pixie Cut Right")
		new_human.f_style = pick("Shaved", "Shaved", "Shaved", "Shaved", "Shaved", "Shaved", "3 O'clock Shadow", "5 O'clock Shadow", "7 O'clock Shadow",)
	else
		if(prob(15))
			first_name = "[capitalize(randomly_generate_japanese_word(rand(1, 3)))]"
		else
			first_name = "[pick(GLOB.first_names_female_clf)]"
		new_human.h_style = pick("CIA", "Mulder", "Pixie Cut Left", "Pixie Cut Right","Bun", "Short Bangs")
	//surname
	if(prob(15))
		last_name = "[capitalize(randomly_generate_japanese_word(rand(1, 4)))]"
	else
		last_name = "[pick(GLOB.last_names_clf)]"
	//put them together
	random_name = "[first_name] [last_name]"
	new_human.change_real_name(new_human, random_name)
	new_human.age = rand(20,55)

/datum/equipment_preset/clfreal/soldier
	name = "CLF Insurgent, Soldier (Rifle)"
	flags = EQUIPMENT_PRESET_EXTRA
	idtype = /obj/item/card/id/dogtag
	paygrades = list(PAY_SHORT_REB = JOB_PLAYTIME_TIER_0)
	access = list(ACCESS_LIST_CLF_BASE)

/datum/equipment_preset/clfreal/soldier/get_assignment(mob/living/carbon/human/new_human)
	return "Rifleman"

/datum/equipment_preset/clfreal/soldier/load_gear(mob/living/carbon/human/new_human)
	new_human.undershirt = "undershirt"
	//back
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/marine/satchel(new_human), WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/tool/weldingtool(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/tool/wirecutters(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/tool/shovel/etool/folded(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/mre_food_packet/clf(new_human), WEAR_IN_BACK)
	//face
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/distress/CLF(new_human), WEAR_L_EAR)
	if(prob(90))
		add_facewrap_forclf(new_human)
	//head
	add_rebel_clf_helmet(new_human)
	//uniform
	add_rebel_clf_uniform(new_human)
	//jacket
	add_rebel_clf_suit(new_human)
	//waist
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/marine(new_human), WEAR_WAIST)
	//limbs
	add_rebel_ua_shoes(new_human)
	if(prob(55))
		add_rebel_gloves(new_human)
	if(prob(5))
		add_rebel_ua_pistol(new_human)
	else
		add_clfreal_rifle(new_human)

	//pockets
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/firstaid/full/alternate, WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/general/medium, WEAR_R_STORE)

/datum/equipment_preset/clfreal/soldier/sniper
	name = "CLF Insurgent, Soldier (Marksman)"
	skills = /datum/skills/clf/sniper

/datum/equipment_preset/clfreal/soldier/sniper/load_gear(mob/living/carbon/human/new_human)
	new_human.undershirt = "undershirt"
	//back
	add_random_satchel(new_human)
	new_human.equip_to_slot_or_del(new /obj/item/tool/weldingtool(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/tool/wirecutters(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/tool/shovel/etool/upp/folded(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/mre_food_packet/clf(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/mre_food_packet/clf(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/mre_food_packet/clf(new_human), WEAR_IN_BACK)
	//face
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/distress/CLF(new_human), WEAR_L_EAR)
	if(prob(95))
		add_facewrap_forclf(new_human)
	//head
	if(prob(85))
		add_rebel_clf_helmet(new_human)
	//uniform
	add_rebel_clf_uniform(new_human)
	//jacket
	add_rebel_clf_suit(new_human)
	//waist
	if(prob(50))
		new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/general_belt/rmc(new_human), WEAR_WAIST)
	else
		new_human.equip_to_slot_or_del(new /obj/item/storage/belt/marine/rmc(new_human), WEAR_WAIST)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/r81m1(new_human), WEAR_IN_BELT)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/r81m1(new_human), WEAR_IN_BELT)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/r81m1(new_human), WEAR_IN_BELT)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/r81m1(new_human), WEAR_IN_BELT)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/r81m1(new_human), WEAR_IN_BELT)
	//limbs
	add_rebel_twe_shoes(new_human)
	new_human.put_in_active_hand(new /obj/item/weapon/gun/rifle/r81m1a/m1b(new_human))
	//pockets
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/firstaid/full/alternate, WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/general/medium, WEAR_R_STORE)

/datum/equipment_preset/clfreal/soldier/shotgun
	name = "CLF Insurgent, Soldier (Shotgun)"

/datum/equipment_preset/clfreal/soldier/shotgun/load_gear(mob/living/carbon/human/new_human)
	new_human.undershirt = "undershirt"
	//back
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/marine/satchel(new_human), WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/tool/weldingtool(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/tool/wirecutters(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/tool/shovel/etool/folded(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/mre_food_packet/clf(new_human), WEAR_IN_BACK)
	//face
	if(prob(90))
		add_facewrap_forclf(new_human)
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/distress/CLF(new_human), WEAR_L_EAR)
	//head
	add_rebel_clf_helmet(new_human)
	//uniform
	add_rebel_clf_uniform(new_human)
	//jacket
	add_rebel_clf_suit(new_human)
	//waist
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/marine(new_human), WEAR_WAIST)
	//limbs
	add_rebel_ua_shoes(new_human)
	if(prob(55))
		add_rebel_gloves(new_human)
	add_rebel_ua_shotgun(new_human)
	//pockets
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/firstaid/full/alternate, WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/general/medium, WEAR_R_STORE)

/datum/equipment_preset/clfreal/soldier/machinegunner
	name = "CLF Insurgent, Soldier (Machinegunner)"

/datum/equipment_preset/clfreal/soldier/machinegunner/load_gear(mob/living/carbon/human/new_human)
	new_human.undershirt = "undershirt"
	//back
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/marine/satchel(new_human), WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/tool/weldingtool(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/tool/wirecutters(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/tool/shovel/etool/folded(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/mre_food_packet/clf(new_human), WEAR_IN_BACK)
	//face
	if(prob(90))
		add_facewrap_forclf(new_human)
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/distress/CLF(new_human), WEAR_L_EAR)
	//head
	add_rebel_clf_helmet(new_human)
	//uniform
	add_rebel_clf_uniform(new_human)
	//jacket
	add_rebel_clf_suit(new_human)
	//waist
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/marine(new_human), WEAR_WAIST)
	//limbs
	add_rebel_ua_shoes(new_human)
	if(prob(85))
		add_rebel_gloves(new_human)
	add_rebel_specialist_weapon(new_human)
	//pockets
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/firstaid/full/alternate, WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/general/medium, WEAR_R_STORE)


/datum/equipment_preset/clfreal/soldier/flamer
	name = "CLF Insurgent, Soldier (Incinerator)"
	skills = /datum/skills/clf/specialist

/datum/equipment_preset/clfreal/soldier/flamer/load_gear(mob/living/carbon/human/new_human)
	new_human.undershirt = "undershirt"
	//back
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/marine/satchel(new_human), WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/tool/weldingtool(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/tool/wirecutters(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/tool/shovel/etool/folded(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/mre_food_packet/clf(new_human), WEAR_IN_BACK)
	//face
	if(prob(90))
		add_facewrap_forclf(new_human)
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/distress/CLF(new_human), WEAR_L_EAR)
	//head
	add_rebel_clf_helmet(new_human)
	//uniform
	add_rebel_clf_uniform(new_human)
	//jacket
	add_rebel_clf_suit(new_human)
	//waist
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/general_belt(new_human), WEAR_WAIST)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/flamer_tank/weak, WEAR_IN_BELT)
	//limbs
	add_rebel_ua_shoes(new_human)
	if(prob(55))
		add_rebel_gloves(new_human)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/flamer/weak(new_human), WEAR_J_STORE)
	//pockets
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/firstaid/full/alternate, WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/general/medium, WEAR_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/flamer_tank/weak, WEAR_IN_R_STORE)


/datum/equipment_preset/clfreal/soldier/leader
	name = "CLF Insurgent, Soldier (Squad Leader)"
	skills = /datum/skills/clf/leader

/datum/equipment_preset/clfreal/soldier/leader/get_assignment(mob/living/carbon/human/new_human)
	return "Squad Leader"

/datum/equipment_preset/clfreal/soldier/leader/load_gear(mob/living/carbon/human/new_human)
	new_human.undershirt = "undershirt"
	//back
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/marine/satchel(new_human), WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/tool/weldingtool(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/tool/wirecutters(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/tool/shovel/etool/folded(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/mre_food_packet/clf(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/device/binoculars/civ(new_human), WEAR_IN_BACK)
	//face
	if(prob(90))
		add_facewrap_forclf(new_human)
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/distress/CLF(new_human), WEAR_L_EAR)
	//head
	add_rebel_clf_helmet(new_human)
	//uniform
	add_rebel_clf_uniform(new_human)
	//jacket
	add_rebel_clf_suit(new_human)
	//waist
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/marine(new_human), WEAR_WAIST)
	//limbs
	add_rebel_ua_shoes(new_human)
	if(prob(65))
		add_rebel_gloves(new_human)
	add_clfreal_rifle(new_human)
	//pockets
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/firstaid/full/alternate, WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/general/medium, WEAR_R_STORE)


/datum/equipment_preset/clfreal/medic
	name = "CLF Insurgent, Medic"
	flags = EQUIPMENT_PRESET_EXTRA
	idtype = /obj/item/card/id/dogtag
	paygrades = list(PAY_SHORT_REB = JOB_PLAYTIME_TIER_0)
	access = list(ACCESS_LIST_CLF_BASE)
	skills = /datum/skills/clf/combat_medic

/datum/equipment_preset/clfreal/medic/get_assignment(mob/living/carbon/human/new_human)
	if(prob(50))
		return "Medic"
	return "Corpsman"

/datum/equipment_preset/clfreal/medic/load_gear(mob/living/carbon/human/new_human)
	new_human.undershirt = "undershirt"
	//back
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/marine/satchel(new_human), WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/tool/shovel/etool/folded(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/mre_food_packet/clf(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/reagent_container/food/drinks/flask/canteen, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/tool/surgery/surgical_line(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/tool/surgery/synthgraft(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/firstaid/softpack/regular(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/firstaid/softpack/adv(new_human), WEAR_IN_BACK)
	//face
	if(prob(90))
		add_facewrap_forclf(new_human)
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/distress/CLF(new_human), WEAR_L_EAR)
	//head
	add_rebel_clf_helmet(new_human)
	//uniform
	add_rebel_clf_uniform(new_human)
	//jacket
	add_rebel_clf_suit(new_human)
	//waist
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/medical/lifesaver/full(new_human), WEAR_WAIST)
	//limbs
	add_rebel_ua_shoes(new_human)
	if(prob(55))
		add_rebel_gloves(new_human)
	add_rebel_ua_pistol(new_human)
	//pockets
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/firstaid/full/alternate, WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/magazine/pistol, WEAR_R_STORE)

/datum/equipment_preset/clfreal/at
	name = "CLF Insurgent, Anti-Tank"
	flags = EQUIPMENT_PRESET_EXTRA
	idtype = /obj/item/card/id/dogtag
	paygrades = list(PAY_SHORT_REB = JOB_PLAYTIME_TIER_0)
	access = list(ACCESS_LIST_CLF_BASE)
	skills = /datum/skills/clf/specialist

/datum/equipment_preset/clfreal/at/get_assignment(mob/living/carbon/human/new_human)
	if(prob(50))
		return "Rifleman"
	return "Rocketeer"

/datum/equipment_preset/clfreal/at/load_gear(mob/living/carbon/human/new_human)
	new_human.undershirt = "undershirt"
	//back
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/marine/satchel/intel/chestrig(new_human), WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/tool/weldingtool(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/tool/wirecutters(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/tool/shovel/etool/folded(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/mre_food_packet/clf(new_human), WEAR_IN_BACK)
	//face
	if(prob(85))
		add_facewrap_forclf(new_human)
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/distress/CLF(new_human), WEAR_L_EAR)
	//head
	add_rebel_clf_helmet(new_human)
	//uniform
	add_rebel_clf_uniform(new_human)
	//jacket
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/utility_vest(new_human), WEAR_JACKET)
	//waist
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/general_belt(new_human), WEAR_WAIST)
	//limbs
	add_rebel_ua_shoes(new_human)
	add_rebel_ua_pistol(new_human)
	new_human.put_in_active_hand(new /obj/item/weapon/gun/launcher/rocket/anti_tank/disposable(new_human))


/datum/equipment_preset/clfreal/commander
	name = "CLF Insurgent, Cell Commander"
	flags = EQUIPMENT_PRESET_EXTRA
	idtype = /obj/item/card/id/dogtag
	paygrades = list(PAY_SHORT_REBC = JOB_PLAYTIME_TIER_0)
	access = list(ACCESS_LIST_CLF_BASE)
	skills = /datum/skills/clf/commander

/datum/equipment_preset/clfreal/commander/get_assignment(mob/living/carbon/human/new_human)
	return "Commander"

/datum/equipment_preset/clfreal/commander/load_gear(mob/living/carbon/human/new_human)
	new_human.undershirt = "undershirt"
	//back
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/rifle/xm177(new_human), WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/device/flashlight/tnr(new_human), WEAR_J_STORE)
	//face
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/distress/CLF(new_human), WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/gas/swat(new_human), WEAR_FACE)
	//head
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/militia(new_human), WEAR_HEAD)
	//uniform
	var/obj/item/clothing/under/marine/veteran/mercenary/support/uniform = new(new_human)
	uniform.suit_restricted = null
	new_human.equip_to_slot_or_del(uniform, WEAR_BODY)
	//jacket
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/militia(new_human), WEAR_JACKET)
	//waist
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/marine(new_human), WEAR_WAIST)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/m16/ap(new_human), WEAR_IN_BELT)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/m16/ap(new_human), WEAR_IN_BELT)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/m16/ap(new_human), WEAR_IN_BELT)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/m16/ap(new_human), WEAR_IN_BELT)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/m16/ap(new_human), WEAR_IN_BELT)
	//limbs
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine(new_human), WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/pistol/clfpistol(new_human), WEAR_IN_SHOES)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine/veteran/insulated(new_human), WEAR_HANDS)

	//pockets
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/firstaid/full/alternate, WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/general/medium, WEAR_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/book/codebook/clf(new_human), WEAR_IN_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/tool/pen/fountain(new_human), WEAR_IN_R_STORE)

