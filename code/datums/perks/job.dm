/datum/perk/survivor
	name = "Sobreviviente"
	desc = "Despues de ver la muerte de muchos conocidos y amigos, presenciar muerte no te sorprende tanto como antes. \
			Reduce a la mitad la perdida de cordura por ver personas morir."
	icon_state = "survivor" // https://game-icons.net/1x1/lorc/one-eyed.html

/datum/perk/survivor/assign(mob/living/carbon/human/H)
	..()
	if(holder)
		holder.sanity.death_view_multiplier *= 0.5

/datum/perk/survivor/remove()
	if(holder)
		holder.sanity.death_view_multiplier *= 2
	..()

/datum/perk/job/artist
	name = "Artista"
	desc = "Tienes mucha experiencia al crear obras de arte. Ganas un 150% a tu ganancia de conocimiento de todas las fuentes pero solo puedes subir de nivel \
			creado obras de arte."
	var/old_max_insight = INFINITY
	var/old_max_resting = INFINITY
	var/old_insight_rest_gain_multiplier = 1

/datum/perk/job/artist/assign(mob/living/carbon/human/H)
	..()
	old_max_insight = holder.sanity.max_insight
	old_max_resting = holder.sanity.max_resting
	old_insight_rest_gain_multiplier = holder.sanity.insight_rest_gain_multiplier
	holder.sanity.max_insight = 100
	holder.sanity.insight_gain_multiplier *= 1.5
	holder.sanity.max_resting = 1
	holder.sanity.insight_rest_gain_multiplier = 0

/datum/perk/job/artist/remove()
	holder.sanity.max_insight += old_max_insight - 100
	holder.sanity.insight_gain_multiplier /= 1.5
	holder.sanity.max_resting += old_max_resting - 1
	holder.sanity.insight_rest_gain_multiplier += old_insight_rest_gain_multiplier
	..()


/datum/perk/selfmedicated
	name = "Experto en medicacion"
	desc = "Tu carrera te a vuelto muy intimo con las diferentes sustancias quimicas. \
			Tu NSA total es incrementada y la chance de ganar adicciones es disminuida."
	icon_state = "selfmedicated" // https://game-icons.net/1x1/lorc/overdose.html

/datum/perk/selfmedicated/assign(mob/living/carbon/human/H)
	..()
	if(holder)
		holder.metabolism_effects.addiction_chance_multiplier = 0.5
		holder.metabolism_effects.nsa_threshold += 10

/datum/perk/selfmedicated/remove()
	if(holder)
		holder.metabolism_effects.addiction_chance_multiplier = 1
		holder.metabolism_effects.nsa_threshold -= 10
	..()

/datum/perk/vagabond
	name = "Vagabundo	"
	desc = "Estas acostumbrado a ver las peores cosas que el mundo puede ofrecer. Tu mente se siente resitente. \
			Este perk reduce la cantidad total de daño de cordura que puedes tomar con lo que pasa alrededor tuyo."
	icon_state = "vagabond" // https://game-icons.net/1x1/lorc/eye-shield.html

/datum/perk/vagabond/assign(mob/living/carbon/human/H)
	..()
	if(holder)
		holder.sanity.view_damage_threshold += 20

/datum/perk/vagabond/remove()
	if(holder)
		holder.sanity.view_damage_threshold -= 20
	..()

/datum/perk/merchant
	name = "Comerciante"
	desc = "Dinero es lo mas importante para ti y es tan poderoso como para mejorar tus habilidades. \
			Este perk te deja usar dinero para subir de nivel. Los creditos tienen que estar en tu mochila."
	icon_state = "merchant" // https://game-icons.net/1x1/lorc/cash.html and https://game-icons.net/1x1/delapouite/graduate-cap.html slapped on https://game-icons.net/1x1/lorc/trade.html

/datum/perk/merchant/assign(mob/living/carbon/human/H)
	..()
	if(holder)
		holder.sanity.valid_inspirations += /obj/item/weapon/spacecash/bundle

/datum/perk/merchant/remove()
	if(holder)
		holder.sanity.valid_inspirations -= /obj/item/weapon/spacecash/bundle
	..()

#define CHOICE_LANG "language" // Random language chosen from a pool
#define CHOICE_TCONTRACT "tcontract" // Traitor contract
#define CHOICE_STASHPAPER "stashpaper" //stash location paper
#define CHOICE_RAREOBJ "rareobj" // Rare loot object

// ALERT: This perk has no removal method. Mostly because 3 out of 4 choices give knowledge to the player in the form of text, that would be pointless to remove.
/datum/perk/deep_connection
	name = "Conexiones profundas	"
	desc = "Con la ayuda de tus numerosos contactos fiables, puedes recolectar informacion util. \
			Te proporciona 1 de 4 bendiciones: un lenguaje, un contrato de traidor, la localizacion de un alijo o una caja con un item especial adentro."
	icon_state = "deepconnection" // https://game-icons.net/1x1/quoting/card-pickup.html

/datum/perk/deep_connection/assign(mob/living/carbon/human/H)
	..()
	if(!holder)
		return
	var/list/choices = list(CHOICE_RAREOBJ)
	if(GLOB.various_antag_contracts.len)
		choices += CHOICE_TCONTRACT
	var/datum/stash/stash = pick_n_take_stash_datum()
	if(stash)
		stash.select_location()
		if(stash.stash_location)
			choices += CHOICE_STASHPAPER
	// Let's see if an additional language is feasible. If the user has them all already somehow, we aren't gonna choose this.
	var/list/valid_languages = list(LANGUAGE_CYRILLIC, LANGUAGE_SERBIAN, LANGUAGE_GERMAN) // Not static, because we're gonna remove languages already known by the user
	for(var/l in valid_languages)
		var/datum/language/L = all_languages[l]
		if(L in holder.languages)
			valid_languages -= l
	if(valid_languages.len)
		choices += CHOICE_LANG
	// Let's pick a random choice
	switch(pick(choices))
		if(CHOICE_LANG)
			var/language = pick(valid_languages)
			holder.add_language(language)
			desc += "En particular, resulta que sabes hablar [language]."
		if(CHOICE_TCONTRACT)
			var/datum/antag_contract/A = pick(GLOB.various_antag_contracts)
			desc += "Sientes que recordaste algo importante."
			holder.mind.store_memory("Gracias a tus conexiones, fuiste alertado acerca de unos indivudos sospechosos por la estacion. En particular, te dijeron que tenian contacto con:" + A.name + ": " + A.desc)
		if(CHOICE_STASHPAPER)
			desc += "Tienens una nota especial contigo."
			stash.spawn_stash()
			var/obj/item/weapon/paper/stash_note = stash.spawn_note()
			holder.equip_to_storage_or_drop(stash_note)
		if(CHOICE_RAREOBJ)
			desc += "Lograste contrabandear un item raro a bordo."
			var/obj/O = pickweight(RANDOM_RARE_ITEM - /obj/item/stash_spawner)
			var/obj/item/weapon/storage/box/B = new
			new O(B) // Spawn the random spawner in the box, so that the resulting random item will be within the box
			holder.equip_to_storage_or_drop(B)

#undef CHOICE_LANG
#undef CHOICE_TCONTRACT
#undef CHOICE_STASHPAPER
#undef CHOICE_RAREOBJ

/datum/perk/sanityboost
	name = "Fe verdadera"
	desc = "Cuando estas cerca de un obelisco, tu mente se siente en paz. Tu regeneracion de cordura es mejorada."
	icon_state = "sanityboost" // https://game-icons.net/1x1/lorc/templar-eye.html

/datum/perk/sanityboost/assign(mob/living/carbon/human/H)
	..()
	if(holder)
		holder.sanity.sanity_passive_gain_multiplier *= 1.5

/datum/perk/sanityboost/remove()
	if(holder)
		holder.sanity.sanity_passive_gain_multiplier /= 1.5
	..()

/// Basically a marker perk. If the user has this perk, another will be given in certain conditions.
/datum/perk/inspiration
	name = "Inspiracion exotica"
	desc = "Obtienes un boost a tus stats de cognicion y mecanica cada vez que consumes alcohol."
	icon_state = "inspiration" // https://game-icons.net/1x1/delapouite/booze.html

/datum/perk/active_inspiration
	name = "Exotic Inspiration (Active)"
	icon_state = "inspiration_active" // https://game-icons.net/1x1/lorc/enlightenment.html

/datum/perk/active_inspiration/assign(mob/living/carbon/human/H)
	..()
	if(holder)
		holder.stats.addTempStat(STAT_COG, 5, INFINITY, "Exotic Inspiration")
		holder.stats.addTempStat(STAT_MEC, 10, INFINITY, "Exotic Inspiration")

/datum/perk/active_inspiration/remove()
	if(holder)
		holder.stats.removeTempStat(STAT_COG, "Exotic Inspiration")
		holder.stats.removeTempStat(STAT_MEC, "Exotic Inspiration")
	..()

/datum/perk/sommelier
	name = "Sumiller"
	desc = "Conoces como aguantar hasta el alcohol mas fuerte del universo."
	icon_state = "inspiration"

/datum/perk/neat
	name = "Pulcro"
	desc = "Estas acostumbrado a ver sangre y suciedad en cualquier formas. Tu lema: una nave limpia es el primer paso hacia la iluminacion. \
			Este perk reduce el daño total a tu sanidad que puedes tomar con lo que pasa alrededor tuyo \
			Recuperas sanidad limpiando."
	icon_state = "neat" // https://game-icons.net/1x1/delapouite/broom.html

/datum/perk/neat/assign(mob/living/carbon/human/H)
	..()
	if(holder)
		holder.sanity.view_damage_threshold += 20

/datum/perk/neat/remove()
	if(holder)
		holder.sanity.view_damage_threshold -= 20
	..()

/datum/perk/greenthumb
	name = "Dedo verde"
	desc = "Despues de crecer plantas por años te has vuelto un botanico experto. Puedes ver toda la informacion de las plantas, desde stats \
	        hasta quimicos en ellas, solo con examinarlas. Cosechar plantas te relaja y por ende recupera tu sanidad."
	icon_state = "greenthumb" // https://game-icons.net/1x1/delapouite/farmer.html

	var/obj/item/device/scanner/plant/virtual_scanner = new

/datum/perk/greenthumb/assign(mob/living/carbon/human/H)
	..()
	virtual_scanner.is_virtual = TRUE

/datum/perk/job/club
	name = "Elevando la barra"
	desc = "Sabes como mezclar bebidas y cambiar vidas. Personas cerca tuyo recuperan sanidad."
	icon_state = "inspiration"

/datum/perk/job/club/assign(mob/living/carbon/human/H)
	..()
	if(holder)
		holder.sanity_damage -= 2

/datum/perk/job/club/remove()
	if(holder)
		holder.sanity_damage += 2
	..()
