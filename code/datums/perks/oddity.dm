/datum/perk/oddity
	gain_text = "Te sientes diferente. La exposicion a las raresas te a cambiado. Ahora no puedes volver atras."

/datum/perk/oddity/fast_walker
	name = "Caminador rapido"
	desc = "Lento y firme gana la carrera. Demuestra que estan equivocados. \
			Te mueves ligeramente mas rapido."
	icon_state = "fast" // https://game-icons.net/1x1/delapouite/fast-forward-button.html

/datum/perk/oddity/ear_of_quicksilver
	name = "Oido de plata"
	desc = "Los secretos no se le escapan a tus orejas. Cuidado, ruidos fuertes son especialmente peligrosos para ti. \
			Tienes un campo de escucha mas grande, pero flashbangs te aturden el doble del tiempo."
	icon_state = "ear" // https://game-icons.net

/datum/perk/oddity/gunslinger
	name = "Pistolero"
	desc = "Apunta, dispara, apunta y dispara devuelta. Eres el pistolero mas rapido del espacio! \
			Disparas armas de una mano un 33% mas rapido."
	icon_state = "dual_shot" // https://game-icons.net/1x1/delapouite/bullet-impacts.html

/datum/perk/oddity/terrible_fate
	name = "Destino terrible"
	desc = "Te diste cuenta de la dolorosa verdad de la muerte. No quieres morir y odias la muerte - morir es un horror inconfundible para ti. \
			Cualquier que este alrededor tuyo al momento de tu muerte va a tener que rodar un checkeo de vigilancia. Si lo fallan, su sanidad instantaneamente caera a 0."
	icon_state = "murder" // https://game-icons.net/1x1/delapouite/chalk-outline-murder.html

/datum/perk/oddity/unfinished_delivery
	name = "Entrega inconclusa"
	desc = "Aun que tu destino es muerte, aun no has llegado hay aun. \
			Tienes una chance de 33% de ser revivido despues de morir."
	icon_state = "regrowth" // https://game-icons.net/1x1/delapouite/stump-regrowth.html

/datum/perk/oddity/lungs_of_iron
	name = "Pulmones de hierro"
	desc = "Tus pulmones incrementaron en volumen. Puedes facilmente ganar una competicion de buceo. \
			Recibes solo la mitad de daño respiratorio."
	icon_state = "lungs" // https://game-icons.net/1x1/lorc/one-eyed.html

/datum/perk/oddity/blood_of_lead
	name = "Sangre de plomo"
	desc = "Comida podrida, basura asquerosa, veneno - todo esto es menos dañino ahora. \
			Recibes solo la mitad de daño de toxinas."
	icon_state = "liver" // https://game-icons.net

/datum/perk/oddity/space_asshole
	name = "Space Asshole"
	desc = "Huecos, gravedad, caer, tropezarse. Es todo lo mismo. \
			Recibes menos daño por caida."
	icon_state = "bomb" // https://game-icons.net

/datum/perk/oddity/space_asshole/assign(mob/living/carbon/human/H)
	..()
	if(holder)
		holder.mob_bomb_defense += 25
		holder.falls_mod -= 0.4

/datum/perk/oddity/space_asshole/remove()
	if(holder)
		holder.mob_bomb_defense -= 25
		holder.falls_mod += 0.4
	..()

/datum/perk/oddity/parkour
	name = "Parkour"
	desc = "Puedes trapar mesas y escaleras mas rapido."
	icon_state = "parkour" //https://game-icons.net/1x1/delapouite/jump-across.html

/datum/perk/oddity/parkour/assign(mob/living/carbon/human/H)
	..()
	if(holder)
		holder.mod_climb_delay -= 0.5

/datum/perk/oddity/parkour/remove()
	if(holder)
		holder.mod_climb_delay += 0.5
	..()

/datum/perk/oddity/charming_personality
	name = "Personalidad encantadora"
	desc = "Un pequeño guiño y una sonrisa con confianza te puede llevar lejos en este lugar. Las personas son mas comodas en tu compania. \
			Ellos recuperaran sanidad si estan cerca de ti."
	icon_state = "flowers" // https://game-icons.net/1x1/lorc/flowers.html

/datum/perk/oddity/charming_personality/assign(mob/living/carbon/human/H)
	..()
	if(holder)
		holder.sanity_damage -= 2

/datum/perk/oddity/charming_personality/remove()
	if(holder)
		holder.sanity_damage += 2
	..()

/datum/perk/oddity/horrible_deeds
	name = "Acciones horribles"
	desc = "La picazon. La sangre. Ellos ven la verdad de tus acciones y estan horrorizados. \
			Personas cerca de ti perderan cordura."
	icon_state = "bad_breath" // https://game-icons.net

/datum/perk/oddity/horrible_deeds/assign(mob/living/carbon/human/H)
	..()
	if(holder)
		holder.sanity_damage += 2

/datum/perk/oddity/horrible_deeds/remove()
	if(holder)
		holder.sanity_damage -= 2
	..()

/datum/perk/oddity/chaingun_smoker
	name = "Fumador metralleta"
	desc = "El cigarillo es tu forma de vida. te hace sentir menos enfermo y mas fuerte cuando masticas algunos cigarros. \
			Te curas minimamente cuando fumas ademas de recuperar cordura mas rapidamente."
	icon_state = "cigarette" // https://game-icons.net

/datum/perk/oddity/nightcrawler
	name = "Rastreador de noche"
	desc = "Eres mas rapido en la oscuridad."
	icon_state = "night" // https://game-icons.net/1x1/lorc/night-sky.html

/datum/perk/oddity/fast_fingers
	name = "Dedos rapidos"
	desc = "Nada esta seguro cerca de tus manos. Eres un verdadero cleptómaniatico. \
			Puedes sacarle cosas a otros sin sonido o avisos, tambien es mas rapido y puedes pasar pastillas en bebidas sin que nadie se de cuenta."
	icon_state = "robber_hand" // https://game-icons.net/1x1/darkzaitzev/robber-hand.html

/datum/perk/oddity/quiet_as_mouse
	name = "Silenciosos como un raton"
	desc = "Ser letal, facil. Silencioso? aun mas facil aun. \
			Eres un 50% mas silencioso."
	icon_state = "footsteps" // https://game-icons.net

/datum/perk/oddity/quiet_as_mouse/assign(mob/living/carbon/human/H)
	..()
	if(holder)
		holder.noise_coeff -= 0.5

/datum/perk/oddity/quiet_as_mouse/remove()
	if(holder)
		holder.noise_coeff += 0.5
	..()

/datum/perk/oddity/balls_of_plasteel
	name = "Bolas de plastiacero"
	desc = "Dolor viene y va. Te acostumbraste ya. \
			Tu tolerancia de dolor critico es mayor."
	icon_state = "golem" // https://game-icons.net

/datum/perk/oddity/junkborn
	name = "Nacido en basura"
	desc = "La basura de un hombre es el tesoro de otro. \
			Tienes una chance mas alta de encontrar items raros en pilas de basura."
	icon_state = "treasure" // https://game-icons.net

/datum/perk/oddity/ass_of_concrete
	name = "Culo de concreto"
	desc = "Años de entrenar tu cuerpo te a convertido en una gran persona. No mas empujes. \
			Nadie puede pasar por ti, nisiquiera en intencion de ayuda. No te resbalaras cuando no haya gravedad."
	icon_state = "muscular" // https://game-icons.net

/datum/perk/oddity/ass_of_concrete/assign(mob/living/carbon/human/H)
	..()
	if(holder)
		holder.mob_bump_flag = HEAVY

/datum/perk/oddity/ass_of_concrete/remove()
	if(holder)
		holder.mob_bump_flag = ~HEAVY
	..()

/datum/perk/oddity/toxic_revenger
	name = "vengador toxico"
	desc = "Tu corazon de oro no importa cuando tu sangre es toxica. Aquellos que respiren tu aire, sufriran tu mismo destino. \
			Personas alrededor tuyo reciben daño de toxinas."
	icon_state = "Hazmat" // https://game-icons.net
	var/cooldown = 1 MINUTES
	var/initial_time

/datum/perk/oddity/toxic_revenger/assign(mob/living/carbon/human/H)
	..()
	initial_time = world.time

/datum/perk/oddity/toxic_revenger/on_process()
	if(!..())
		return
	if(holder.species.flags & NO_BREATHE || holder.internal)
		return
	if(world.time < initial_time + cooldown)
		return
	initial_time = world.time
	for(var/mob/living/L in viewers(holder, 5))
		if(!L)
			continue
		if(ishuman(L))
			var/mob/living/carbon/human/H = L
			if(H.stat == DEAD || H.internal || H.stats.getPerk(PERK_TOXIC_REVENGER) || (H.species.flags & NO_BREATHE))
				continue
		L.reagents?.add_reagent("toxin", 5)
		L.emote("cough")
		to_chat(L, SPAN_WARNING("[holder] Emite un olor extraño."))

/datum/perk/oddity/absolute_grab
	name = "Agarre absoluto"
	desc = "A veces paga ser el depredador. Tu no agarras, tu embistes. \
			Puedes agarrar personas que esten a un tile de distancia. No funciona si hay objetos entre ustedes."
	icon_state = "grab" // https://game-icons.net

/datum/perk/oddity/sure_step
	name = "Pisada segura"
	desc = "Es mas probable que evadas trampas."
	icon_state = "mantrap"

/datum/perk/oddity/market_prof
	name = "Profesional del mercado"
	desc = "Solo examinando los items podes saber cuanto cuestan."
	icon_state = "market_prof"

///////////////////////////////////////
//////// NT ODDITYS PERKS /////////////
///////////////////////////////////////

/datum/perk/nt_oddity
	gain_text = "Dios te a elegigo para expandir su voluntad."

/datum/perk/nt_oddity/holy_light
	name = "Luz divina"
	desc = "Has sido tocado por el poder divino. Emites una debil aura curadora, curando daño bruto y quemaduras a cualquier Neoteologista que este cerca de ti."
	icon_state = "third_eye"  //https://game-icons.net/1x1/lorc/third-eye.html
	var/healing_power = 0.1
	var/cooldown = 1 SECONDS // Just to make sure that perk don't go berserk.
	var/initial_time

/datum/perk/nt_oddity/holy_light/assign(mob/living/carbon/human/H)
	..()
	initial_time = world.time

/datum/perk/nt_oddity/holy_light/on_process()
	if(!..())
		return
	if(!holder.get_core_implant(/obj/item/weapon/implant/core_implant/cruciform))
		return
	if(world.time < initial_time + cooldown)
		return
	initial_time = world.time
	for(var/mob/living/L in viewers(holder, 7))
		if(ishuman(L))
			var/mob/living/carbon/human/H = L
			if(H.stat == DEAD || !(H.get_core_implant(/obj/item/weapon/implant/core_implant/cruciform)))
				continue
			H.adjustBruteLoss(-healing_power)
			H.adjustFireLoss(-healing_power)
