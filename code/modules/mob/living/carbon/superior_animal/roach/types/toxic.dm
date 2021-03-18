/mob/living/carbon/superior_animal/roach/toxic
	name = "Gestrahlte Roach"
	desc = "Una bestia enorme de desechos verdes y congelados. Tiene una glándula salival agrandada para lanzar proyectiles."
	icon_state = "radioactiveroach"

	meat_amount = 3
	turns_per_move = 1
	maxHealth = 45
	health = 45

	contaminant_immunity = TRUE

	melee_damage_lower = 3
	melee_damage_upper = 7 //Weaker than hunter
	rarity_value = 22.5

/mob/living/carbon/superior_animal/roach/toxic/UnarmedAttack(atom/A, var/proximity)
	. = ..()
	if(isliving(A))
		var/mob/living/L = A
		if(istype(L) && prob(25))
			var/damage = rand(melee_damage_lower, melee_damage_upper)
			L.damage_through_armor(damage, TOX)
			playsound(src, 'sound/voice/insect_battle_screeching.ogg', 30, 1, -3)
			L.visible_message(SPAN_DANGER("\the [src] se derrama un poco de bilis tóxica por todas partes \the [L]!"))
