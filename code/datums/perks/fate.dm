/datum/perk/fate/paper_worm
	name = "Burocrático"
	desc = "Siempre fuiste un empleado y un burocrata toda tu vida. Oficinas apretadas con personas enojadas es donde tu personalidad fue forjada. \
			Tienes stats mas bajas en todo, pero tienes una mayor chance de conseguir aumentos de stats extra cuando subis de nivel."
	icon_state = "paper"

/datum/perk/fate/paper_worm/assign(mob/living/carbon/human/H)
	..()
	if(holder)
		holder.sanity.positive_prob += 20

/datum/perk/fate/paper_worm/remove()
	if(holder)
		holder.sanity.positive_prob -= 20
	..()

/datum/perk/fate/freelancer
	name = "Independiente"
	icon_state = "skills"
	desc = "Cualquier sea tu trabajo, nunca pudieste estar en un lugar por mucho tiempo o tuviste contactos duraderos. \
			este perk checkea tu mayor stat, lo baja por 10 puntos y mejora toda las otras por 4 puntos."

/datum/perk/fate/freelancer/assign(mob/living/carbon/human/H)
	..()
	var/maxstat = -INFINITY
	var/maxstatname
	spawn(1)
		for(var/name in ALL_STATS)
			if(holder.stats.getStat(name, TRUE) > maxstat)
				maxstat = holder.stats.getStat(name, TRUE)
				maxstatname = name
		for(var/name in ALL_STATS)
			if(name != maxstatname)
				holder.stats.changeStat(name, 4)
			else
				holder.stats.changeStat(name, -10)

/datum/perk/fate/nihilist
	name = "Nihilista"
	desc = 	"En algun punto de tu vida te rendiste en que te importara esta. \
			Esto incrementa tu chance de ataques de panicos positivos por un 10% y los negativos por un 20%. Ver a alguien morir tiene un efecto aleatorio en ti: \
			algunas veces no tendras ninguna perdida de salud mental y quizas ganes sanidad, o consigas un boost a tu cognicion."
	icon_state = "eye" //https://game-icons.net/1x1/lorc/tear-tracks.html

/datum/perk/fate/nihilist/assign(mob/living/carbon/human/H)
	..()
	if(holder)
		holder.sanity.positive_prob += 10
		holder.sanity.negative_prob += 20

/datum/perk/fate/nihilist/remove()
	if(holder)
		holder.sanity.positive_prob -= 10
		holder.sanity.negative_prob -= 20
		holder.stats.removeTempStat(STAT_COG, "Fate Nihilist")
	..()

/datum/perk/fate/moralist
	name = "Moralista"
	icon_state = "moralist" //https://game-icons.net/
	desc = "Un dia llegara donde el coraje de los hombres caera, cuando abandonemos a nuestros amigos y rompamos todo los lazos de compañerismo. \
			Pero este no es ese dia. Este sera el dia donde lucharas! \
			Ganas conocimiento mas rapido cuando estas rodeado de gente sana y ellos recuperaran sanidad si estan cerca de ti. \
			Cuando estas cerca de personas que estan con salud mental baja, empezaras a tomar daño a tu propia sanidad."

/datum/perk/fate/drug_addict
	name = "Adicto a las drogas"
	icon_state = "medicine" //https://game-icons.net/1x1/delapouite/medicines.html
	desc = "Por razones que no puedes recordar, decidiste recurrir al uso de drogas. Ahora perdiste la batalla y sufres las consecuencias. \
			Empiezas con una adiccion a una droga aleatoria, ademas de una botella de pildoras que contienen tal droga."

/datum/perk/fate/drug_addict/assign(mob/living/carbon/human/H)
	..()
	spawn(1)
		var/turf/T = get_turf(holder)
		var/drugtype = pick(subtypesof(/datum/reagent/drug))
		if(!(drugtype in holder.metabolism_effects.addiction_list))
			var/datum/reagent/drug = new drugtype
			holder.metabolism_effects.addiction_list.Add(drug)
			for(var/j= 1 to 2)
				var/obj/item/weapon/storage/pill_bottle/PB = new /obj/item/weapon/storage/pill_bottle(T)
				PB.name = "bottle of happiness"
				for(var/i=1 to 7)
					var/obj/item/weapon/reagent_containers/pill/pill = new /obj/item/weapon/reagent_containers/pill(T)
					pill.reagents.add_reagent(drug.id, pill.volume)
					pill.name = "happy pill"
					PB.handle_item_insertion(pill)
				holder.equip_to_storage_or_drop(PB)

/datum/perk/fate/alcoholic
	name = "Alcoholico"
	icon_state = "beer" //https://game-icons.net/1x1/delapouite/beer-bottle.html
	desc = "Siempre imaginaste que la salida de todos tus problemas y dolores se encontraba al fondo de la botella, pero ese camino solo te dirigio a un laberinto. \
			Tienes una adiccion al alcohol, cosa que te da un boost a tu robustez mientras estes bajo la influencia pero te baja la cognicion permanentemente."

/datum/perk/fate/alcoholic/assign(mob/living/carbon/human/H)
	..()
	var/ethanoltype = pick(subtypesof(/datum/reagent/ethanol))
	if(!(ethanoltype in holder.metabolism_effects.addiction_list))
		var/datum/reagent/alcohol = new ethanoltype
		holder.metabolism_effects.addiction_list.Add(alcohol)

/datum/perk/fate/alcoholic_active
	name = "Alcoholic (active)"
	icon_state = "drinking" //https://game-icons.net/1x1/delapouite/drinking.html

/datum/perk/fate/alcoholic_active/assign(mob/living/carbon/human/H)
	..()
	if(holder)
		holder.stats.addTempStat(STAT_ROB, 10, INFINITY, "Fate Alcoholic")
		holder.stats.addTempStat(STAT_TGH, 10, INFINITY, "Fate Alcoholic")
		holder.stats.addTempStat(STAT_VIG, 10, INFINITY, "Fate Alcoholic")

/datum/perk/fate/alcoholic_active/remove()
	if(holder)
		holder.stats.removeTempStat(STAT_ROB, "Fate Alcoholic")
		holder.stats.removeTempStat(STAT_TGH, "Fate Alcoholic")
		holder.stats.removeTempStat(STAT_VIG, "Fate Alcoholic")
	..()

/datum/perk/fate/noble
	name = "Noble"
	icon_state = "family" //https://game-icons.net
	desc = "Eres el decendiente de una gran y prospera familia, llevando un nombre de gran status que puede se trasar hasta las civilizaciones mas jovenes de tu dominio. \
			Empiezas con un arma reliquia, mayor chance de ser marcado como objetivo de traidores y tu cap de perdida de sanidad es removida. Mantente alejado del peligro y la suciedad."

/datum/perk/fate/noble/assign(mob/living/carbon/human/H)
	..()
	if(!holder)
		return
	holder.sanity.environment_cap_coeff -= 1
	if(!holder.family_name)
		holder.stats.removePerk(src.type)
		return
	var/turf/T = get_turf(holder)
	var/obj/item/W = pickweight(list(
				/obj/item/weapon/tool/knife/ritual = 0.5,
				/obj/item/weapon/tool/sword = 0.2,
				/obj/item/weapon/tool/sword/katana = 0.2,
				/obj/item/weapon/tool/knife/dagger/ceremonial = 0.8,
				/obj/item/weapon/gun/projectile/revolver = 0.4))
	holder.sanity.valid_inspirations += W
	W = new W(T)
	W.desc += " Esta inscrito con el nombre de tu familia \"[holder.family_name]\"."
	var/oddities = rand(2,4)
	var/list/stats = ALL_STATS
	var/list/final_oddity = list()
	for(var/i = 0 to oddities)
		var/stat = pick(stats)
		stats.Remove(stat)
		final_oddity += stat
		final_oddity[stat] = rand(1,7)
	W.AddComponent(/datum/component/inspiration, final_oddity)
	W.AddComponent(/datum/component/atom_sanity, 1, "") //sanity gain by area
	W.sanity_damage -= 1 //damage by view
	spawn(1)
		holder.equip_to_storage_or_drop(W)

/datum/perk/fate/noble/remove()
	if(holder)
		holder.sanity.environment_cap_coeff += 1
	..()

/datum/perk/fate/rat
	name = "Rata"
	desc = "Por todo lo que sabes, tomar lo que no es tuyo es lo que mejor se te da. Se ese picardo, robador o asesino. Es todo lo mismo no importa que nombre le pongas despues de todo. \
			Empiezas  con +10 en la stat mecanica y -10 a tu vigilancia. Vas a tener -10 salud mental en general, significando que vas a tener un ataque nerviso mas rapido que los demas. \
			Adicionalmente eres mas silencioso con tus pasos y tienes una chance de no activar trampas en el piso."
	icon_state = "rat" //https://game-icons.net/

/datum/perk/fate/rat/assign(mob/living/carbon/human/H)
	..()
	if(holder)
		holder.sanity.max_level -= 10

/datum/perk/fate/rat/remove()
	if(holder)
		holder.sanity.max_level += 10
	..()

/datum/perk/fate/rejected_genius
	name = "Genio rechazado"
	desc = "Ves el mundo en diferentes formas y colores. \
			Tu cap de perdida de sanidad es removida, asi que mantende alejado de cuerpos o suciedad. Tienes una salud mental menor y no chance de ataques nerviosos positivos. \
			A cambio, ganas conocimiento un 50 porciento mas rapido que los demas."
	icon_state = "knowledge" //https://game-icons.net/

/datum/perk/fate/rejected_genius/assign(mob/living/carbon/human/H)
	..()
	if(holder)
		holder.sanity.environment_cap_coeff -= 1
		holder.sanity.positive_prob_multiplier -= 1
		holder.sanity.insight_passive_gain_multiplier *= 1.5
		holder.sanity.max_level -= 20

/datum/perk/fate/rejected_genius/remove()
	if(holder)
		holder.sanity.environment_cap_coeff += 1
		holder.sanity.positive_prob_multiplier += 1
		holder.sanity.insight_passive_gain_multiplier /= 1.5
		holder.sanity.max_level += 20
	..()

/datum/perk/fate/oborin_syndrome
	name = "Sindrome de oborin"
	icon_state = "prism" //https://game-icons.net/1x1/delapouite/prism.html
	desc = "Una condicion manifestada en algun punto de la historia humana. \
			Su origen y prevalencia es desconocida, pero es especulado ser un fenomeno psionico.\
			Tu salud mental es mayor a las de los demas al costo de los colores del mundo."

/datum/perk/fate/oborin_syndrome/assign(mob/living/carbon/human/H)
	..()
	if(holder)
		holder.sanity.max_level += 20
		spawn(1)
			holder.update_client_colour() //Handle the activation of the colourblindness on the mob.

/datum/perk/fate/oborin_syndrome/remove()
	if(holder)
		holder.sanity.max_level -= 20
	..()

/datum/perk/fate/lowborn
	name = "Clase Baja"
	icon_state = "ladder" //https://game-icons.net/1x1/delapouite/hole-ladder.html
	desc = "Vives al fondo de la sociedad. La suciedad y la mugre en el tacón de una bota. Tuviste una chance y la tomaste. \
			No puedes ser una persona de autoridad. Adicionalmente, tienes la habilidad de tener un nombre sin un apellido ademas de tener una salud mental mayor."

/datum/perk/fate/lowborn/assign(mob/living/carbon/human/H)
	..()
	if(holder)
		holder.sanity.max_level += 10

/datum/perk/fate/lowborn/remove()
	if(holder)
		holder.sanity.max_level -= 10
	..()
