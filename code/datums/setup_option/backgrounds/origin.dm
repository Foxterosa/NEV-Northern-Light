//As a general rule, all origin backrounds must have summ of +5 of stat values

/datum/category_group/setup_option_category/background/origin
	name = "Origen"
	category_item_type = /datum/category_item/setup_option/background/origin

/datum/category_item/setup_option/background/origin

/datum/category_item/setup_option/background/origin/oberth
	name = "Mercenario"
	desc = "Eres un soldado de profesión, ya sea con una PMC o con el gobierno actual. El combate cuerpo a cuerpo no te es desconocido, pero estás más acostumbrado a tener las manos alrededor de un rifle. \
			Incluso si ese rifle es más bien una escopeta."

	stat_modifiers = list(
		STAT_ROB = 5,
		STAT_TGH = 5,
		STAT_BIO = 0,
		STAT_MEC = 6,
		STAT_VIG = 10,
		STAT_COG = -8
	)

/datum/category_item/setup_option/background/origin/oberth/apply(mob/living/carbon/human/character)
  ..()
  character.add_language(LANGUAGE_GERMAN)


/datum/category_item/setup_option/background/origin/predstraza
	name = "Maton"
	desc = "Eres un tipo desagradable, ¿no? \
			Quizá seas un delincuente, o quizá te hayas metido en muchas peleas. En cualquier caso, sabes cómo mover tu peso y cómo no ser agarrado con la guardia baja. \
			...Aunque...todos esos golpes a la cabeza pueden haber dejado algunas cosas flojas hay adentro..."

	stat_modifiers = list(
		STAT_ROB = 8,
		STAT_TGH = 8,
		STAT_BIO = -5,
		STAT_MEC = -10,
		STAT_VIG = 6,
		STAT_COG = -10
	)


/datum/category_item/setup_option/background/origin/sich_prime
	name = "Vagabundo"
	desc = "Estás acostumbrado a tener que hacer lo que sea necesario para sobrevivir, a remendar tus propias heridas para sobrevivir, y ser... familiar, con la forma de pasar por cerraduras."

	stat_modifiers = list(
		STAT_ROB = 5,
		STAT_TGH = -5,
		STAT_BIO = 5,
		STAT_MEC = 8,
		STAT_VIG = 0,
		STAT_COG = -5
	)


/datum/category_item/setup_option/background/origin/new_rome
	name = "Asistente"
	desc = "Generalmente has pasado la mayor parte de tu vida como la segunda nota de gente más importante. \
			En su tiempo, ha cogido unos cuantos trucos. El que todo lo sabe pero el maestro de nada."

	stat_modifiers = list(
		STAT_ROB = 2,
		STAT_TGH = 8,
		STAT_BIO = 6,
		STAT_MEC = 10,
		STAT_VIG = -6,
		STAT_COG = -3
	)


/datum/category_item/setup_option/background/origin/shimatengoku
	name = "Academico"
	desc = "Estás más familiarizado con el estudio y la práctica de tu oficio que con la forma de matar una cucaracha del tamaño de un caballo.\
			Como compensación, al menos es probable que ganes más que tus compañeros... probablemente. \
			Más especializado en el trabajo en el planeta que en una nave que apenas se mantiene unida con cinta adhesiva y rezos, tendrá que ser muy precavido para evitar desafortunados accidentes..."

	stat_modifiers = list(
		STAT_ROB = -8,
		STAT_TGH = -8,
		STAT_BIO = 15,
		STAT_MEC = 15,
		STAT_VIG = -5,
		STAT_COG = 15
	)


/datum/category_item/setup_option/background/origin/hmss_destined
	name = "Tripulante"
	desc = "No eres familiar con trabajar en naves espaciales. Tal vez lleves algún tiempo trabajando para NanoTrasen, o tal vez hayas formado parte de alguna armada.\
			 En cualquier caso, conoces los detalles generales de trabajar en una nave."

	stat_modifiers = list(
		STAT_ROB = 7,
		STAT_TGH = 6,
		STAT_BIO = -6,
		STAT_MEC = 8,
		STAT_VIG = 0,
		STAT_COG = -10
	)


/datum/category_item/setup_option/background/origin/crozet
	name = "Colonista"
	desc = "Estás acostumbrado a trabajar en el planeta, ya sea en la ganadería, en la reparación de naves o en la extracción de minerales. Este trabajo en una nave espacial de lujo está muy lejos de lo que estás acostumbrado, pero paga bien."

	stat_modifiers = list(
		STAT_ROB = 6,
		STAT_TGH = 10,
		STAT_BIO = -3,
		STAT_MEC = 2,
		STAT_VIG = 10,
		STAT_COG = -2
	)


/datum/category_item/setup_option/background/origin/first_expeditionary_fleet
	name = "Activista"
	desc = "Tienes un conjunto de creencias fuertes y te atienes a ellas. No tienes miedo de chocar con la autoridad cuando se trata de empujar. \
			Tal vez incluso estés en la NEV Northern Light porque estás huyendo de la ley. De cualquier manera, sigues llevando a cabo tu campaña de justicia."

	stat_modifiers = list(
		STAT_ROB = 5,
		STAT_TGH = 0,
		STAT_BIO = -5,
		STAT_MEC = -5,
		STAT_VIG = 5,
		STAT_COG = 5
	)


/datum/category_item/setup_option/background/origin/end_point
	name = "Mecanico"
	desc = "Para decirlo sin vueltas, eres bueno con las máquinas. Muy bueno. Tal vez te especialices en motores, o en trabajos de electricista, pero sabes moverte por un taller."

	stat_modifiers = list(
		STAT_ROB = -3,
		STAT_TGH = -2,
		STAT_BIO = 0,
		STAT_MEC = 15,
		STAT_VIG = 3,
		STAT_COG = 8
	)


/datum/category_item/setup_option/background/origin/nss_forecaster
	name = "Nomada"
	desc = "Solías vagar por las estrellas. Tal vez todavía lo haces. ¿Por qué ibas a echar de menos tu casa cuando tu hogar está a tu alrededor? Hay tanto que ver, ¡y tú estás preparado para todo! \
			Tu falta de asentamiento hace que no tengas un conocimiento profundo de ningún tema en particular, pero siempre has podido solucionar eso con tus conocimientos generales y tu ingenio.\
			Hasta el momento, por lo menos	."

	stat_modifiers = list(
		STAT_ROB = 2,
		STAT_TGH = 2,
		STAT_BIO = -10,
		STAT_MEC = 2,
		STAT_VIG = 10,
		STAT_COG = 2
	)


/datum/category_item/setup_option/background/origin/eureka
    name = "Eureka"
    desc = "Una vez fue un paraíso para los colonos australianos que vivían en él, su neutralidad durante las guerras corporativas les costó este paraíso. \
            Y así, el Sindicato y Nanotrasen bombardearon Eureka hasta el infierno, provocando que las tierras antes verdes se convirtieran en desiertos infernales de proporciones nucleares. \
            Como efecto secundario de esto, una vez que las guerras corporativas terminaron, los eurekanos son conocidos por ser extrañamente buenos rastreadores y exploradores en estas condiciones y en otros lugares, haciendo que lo que queda del pueblo eurekano paguen tributo a la Hansa y a la Neoteología ambos en forma de criminales. \
            Todo en nombre de salvar lo que queda."

    stat_modifiers = list(
        STAT_ROB = -5,
        STAT_TGH = 5,
        STAT_BIO = 10,
        STAT_MEC = -10,
        STAT_VIG = 10,
        STAT_COG = -5
    )
    
