/datum/reagent/organic/nutriment/batter
	name = "Batter"
	id = "batter"
	description = "A gooey mixture of eggs and flour, a base for turning wheat into food."
	taste_description = "blandness"
	nutriment_factor = 3
	color = "#ffd592"
	taste_tag = list(TASTE_SWEET,TASTE_SLIMEY)

/datum/reagent/nutriment/batter/touch_turf(var/turf/simulated/T)
	if(!istype(T, /turf/space))
		new /obj/effect/decal/cleanable/pie_smudge(T)
		if(T.wet > 1)
			T.wet = min(T.wet, 1)
		else
			T.wet = 0

/datum/reagent/organic/nutriment/cakebatter
	name = "Cake Batter"
	id = "cake batter"
	description = "A gooey mixture of eggs, flour and sugar, a important precursor to cake!"
	taste_description = "swettness"
	nutriment_factor = 0.3
	color = "#ffe992"
	taste_tag = list(TASTE_SWEET)

/datum/reagent/organic/nutriment/soybatter
	name = "Vegan Batter"
	id = "soy batter"
	description = "A gooey mixture of soy and flour, a base for turning wheat into food."
	taste_description = "blandness"
	nutriment_factor = 3
	color = "#ffd592"
	taste_tag = list(TASTE_SWEET,TASTE_SLIMEY)


