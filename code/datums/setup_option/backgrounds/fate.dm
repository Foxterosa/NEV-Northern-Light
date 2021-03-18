/datum/category_group/setup_option_category/background/fate
	name = "Destino"
	category_item_type = /datum/category_item/setup_option/background/fate

/datum/category_item/setup_option/background/fate

/datum/category_item/setup_option/background/fate/paper_worm
	name = "Burocrático"
	desc = "Siempre fuiste un oficinista y un burocrata toda tu vida. Oficinas apretadas con personas enojadas es donde tu personalidad se forjo. \
			El café es tu sangre, tu mente son eslóganes corporativos y la vida personal es inexistente. \
			Pero aquí estás, en una nave espacial volando hacia el infierno. Hay algo más para ti, algo que puede salir a la luz más tarde."

	stat_modifiers = list(
		STAT_ROB = -10,
		STAT_TGH = -10,
		STAT_BIO = -10,
		STAT_MEC = -10,
		STAT_VIG = -10,
		STAT_COG = -10
	)
	perks = list(PERK_PAPER_WORM)

/datum/category_item/setup_option/background/fate/freelancer
	name = "Independiente"
	desc = "Sea cual sea tu trabajo, nunca pudiste estar en un sitio demasiado tiempo ni tener contactos duraderos. \
			Siempre estas en movimiento, buscando un futuro más brillante en el otro lado. \
			Y porque nunca te especializaste tanto como deberías,ahora tienes una más amplia series de habilidades."

	perks = list(PERK_FREELACER)

/datum/category_item/setup_option/background/fate/nihilist
	name = "Nihilista"
	desc = "En algun punto de tu vida te rendiste en que esta te importara. \
			Decidiendo ignorar la ilusión de la moral y la justicia, te das cuenta de que sólo hay una cosa que vale la pena en esta vida. Tu mismo. \
			¿Seguirás siendo leal sólo a ti mismo cuando se abran las puertas del infierno?"

	perks = list(PERK_NIHILIST)

/datum/category_item/setup_option/background/fate/moralist
	name = "Moralista"
	desc = "Un dia llegara donde el coraje de los hombres caera, cuando abandonemos a nuestros amigos y rompamos todo los lazos de compañerismo. \
			Pero este no es ese dia. Este sera el dia donde lucharas! \
			Lleva este llama contigo y ilumina el camino de los demás."

	perks = list(PERK_MORALIST)


/datum/category_item/setup_option/background/fate/drug_addict
	name = "Adicto a las drogas"
	desc = "Por razones que no recuerdas, decidiste recurrir al consumo de drogas importantes. Pero has perdido la batalla, y ahora sufres las consecuencias. \
			Ahora es todo lo que te impulsa a seguir adelante. Todo lo que te queda para luchar contra la cruel realidad, o para escapar de ella durante algún tiempo."

	perks = list(PERK_DRUG_ADDICT)


/datum/category_item/setup_option/background/fate/alcoholic
	name = "Alcoholico"
	desc = "Imaginaste la salida de todos tus problemas y dolores se encontraban al fondo de la botella, pero este camino sólo te condujo a un laberinto. \
			Nunca dejaste de volver por mas, intentándolo una y otra vez, envenenando tu mente hasta que perdiste el control. Ahora tu cara es testigo de tu autodestrucción. \
			Sólo hay una clave para sobrevivir, y es el líquido que te ha mostrado el camino hacia abajo."

	stat_modifiers = list(STAT_COG = -10)
	perks = list(PERK_ALCOHOLIC)

/datum/category_item/setup_option/background/fate/noble
	name = "Noble"
	desc = "Eres descendiente de una familia longeva, formando parte de un linaje de alto estatus que se remonta a las primeras civilizaciónes de tu dominio. \
			¿Qué legado construirás? \
			Empiezas con un arma reliquia, mayor chance de ser marcado como objetivo de traidores y tu cap de perdida de sanidad es removida. Mantente alejado del peligro y la suciedad."
			
	perks = list(PERK_NOBLE)

/datum/category_item/setup_option/background/fate/rat
	name = "Rata"
	desc = "Por todo lo que sabes, tomar lo que no es tuyo es lo que mejor se te da. Se ese picardo, robador o asesino. Es todo lo mismo no importa que nombre le pongas despues de todo. \
			Conoces las formas de infiltración, de salvamento y de salir ileso con los bolsillos más llenos."

	perks = list(PERK_RAT)
	stat_modifiers = list(
		STAT_MEC = 10,
		STAT_VIG = -10
	)

/datum/category_item/setup_option/background/fate/rejected_genius
	name = "Genio rechazado"
	desc = "Ves el mundo en diferentes formas y colores. \
			Sabes que la verdad está ahí fuera, que sólo necesitas ese último empujón para descubrir la terrible verdad más allá.\
			Así que seguiste empujando, sin dejar de buscar el conocimiento, para absorber todo lo que la vida y la muerte tenían que ofrecer. \
			Finalmente esta expedición revelará los secretos del universo. O te romperá para siempre."

	perks = list(PERK_REJECTED_GENIUS)

/datum/category_item/setup_option/background/fate/oborin_syndrome
	name = "Sindrome de oborin"
	desc = "Una condición manifestada en algún momento reciente de la historia de la humanidad. \
			Se desconoce su origen y prevalencia, pero se especula que es un fenómeno psiónico.\
			Estás afectado por el llamado Síndrome de Oborin y eres incapaz de ver los colores del mundo. Ves lo que hay más allá de ellos."

	perks = list(PERK_OBORIN_SYNDROME)

/datum/category_item/setup_option/background/fate/lowborn
	name = "Clase Baja"
	desc = "Eres el fondo de la sociedad. La suciedad y la mugre en el tacón de una bota. Tuviste una oportunidad y la tomaste. \
			Nunca conociste a tus padres y tuviste la suerte de aprender a leer, y eso, con el tiempo, te consiguió un puesto en esta nave. \
			¿Seguirías eligiendo formar parte de este viaje si supieras lo que significa? ¿Dejarás huella o serás olvidado para siempre? \
			No puedes jugar roles de comando. Tienes la posibilidad de tener un nombre sin apellido y tienes una cantidad de cordura aumentada."

	restricted_jobs = list(/datum/job/captain, /datum/job/hop, /datum/job/chaplain, /datum/job/merchant, /datum/job/cmo, /datum/job/rd, /datum/job/ihc)
	restricted_depts = IRONHAMMER | MEDICAL | SCIENCE
	perks = list(PERK_LOWBORN)
