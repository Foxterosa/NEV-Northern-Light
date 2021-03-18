
var/list/dreams = list(
	"una tarjeta de identificacion","una botella","una cara familiar","un tripulante","una caja de herramientas","un operativo Aegis ","el capitan",
	"voces por todas partes","el espacio profundo","un doctor","el motor","un traidor","un aliado","oscuridad",
	"luz","un cientifico","un mono","una catastrofe","un ser querido","un arma","calor","frio","el sol",
	"un sombrero","la Luna","una estacion arruinada","un planeta","phoron","aire","la via medica","el puente","luces parpadeantes",
	"una luz azul","un laboratorio abandonado","NanoTrasen","mercenarios","sangre","curacion","poder","respeto",
	"ricos","espacio","un choque","felicidad","orgullo","una caida","agua","llamas","hielo","melones","volar","los huevos","dinero",
	"el cabeza de personal","el comandante de Aegis ","el jefe ingeniero","el directora de ciencias","el director medico",
	"el inspector","el sargento de artilleria","un miembro de asuntos internos","un ingeniero","el concerje","el tecnico atmosferico",
	"el mercader de la union","un tecnico de la union","el botanico","el minero de la union","el psicologo","el quimico","el genetico",
	"el virologo","el robotico","el chef","el camarero","el clerigo","el bibliotecario","un raton",
	"una playa","el holodeck","una habitacion humeante","una voz","el frio...","odio","una mesa de operaciones","el bar","la lluvia",
	"el core de la AI","la estacion minera","la estacion cientifica","un vaso con un liquido extraño","amor"
	)

mob/living/carbon/proc/dream()
	dreaming = 1

	spawn(0)
		for(var/i = rand(1,4),i > 0, i--)
			to_chat(src, "\blue <i>... [pick(dreams)] ...</i>")
			sleep(rand(40,70))
			if(paralysis <= 0)
				dreaming = 0
				return 0
		dreaming = 0
		return 1

mob/living/carbon/proc/handle_dreams()
	if(client && !dreaming && prob(5))
		dream()

mob/living/carbon/var/dreaming = 0
