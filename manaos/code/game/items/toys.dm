/obj/item/toy/figure/arkin
	name = "figura de accion: Arkin"
	desc = "Una figura de accion de Arkin marca \"Manaos\". Huele a nicotina."
	icon = 'manaos/icons/obj/toy.dmi'
	icon_state = "arkin"

/obj/item/toy/figure/smug
	name = "figura de accion: Smug"
	desc = "Una figura de accion de Smug marca \"Manaos\"."
	icon = 'manaos/icons/obj/toy.dmi'
	icon_state = "smug"

/obj/item/toy/figure/alicia
	name = "figura de accion: Alicia"
	desc = "Una figura de accion de Smug marca \"Manaos\". IS SCIENCE TIME!"
	icon = 'manaos/icons/obj/toy.dmi'
	icon_state = "alicia"

/obj/item/toy/figure/ana
	name = "figura de accion: Ana"
	desc = "Una figura de accion de Ana marca \"Manaos\". Chale..."
	icon = 'manaos/icons/obj/toy.dmi'
	icon_state = "ana"
	var/cooldown = 0
/obj/item/toy/figure/ana/attack_self(mob/user as mob)
	if(cooldown < world.time - 8)
		playsound(user, 'manaos/sound/misc/slime_squish.ogg', 20, 1)
		cooldown = world.time
/obj/item/toy/figure/ana/attack_hand(mob/user as mob)
	if(loc == user)
		if(cooldown < world.time - 8)
			playsound(user, 'manaos/sound/misc/slime_squish.ogg', 20, 1)
			cooldown = world.time
			return
	..()

/obj/item/toy/figure/sydney1
	name = "figura de accion: Sydney"
	desc = "Una figura de accion de Sydney marca \"Manaos\". *aslap"
	icon = 'manaos/icons/obj/toy.dmi'
	icon_state = "sydney1"

/obj/item/toy/figure/sydney2
	name = "figura de accion: Sydney maga"
	desc = "Una figura de accion de Sydney maga marca \"Manaos\". *aslap"
	icon = 'manaos/icons/obj/toy.dmi'
	icon_state = "sydney2"

/obj/item/toy/figure/jr
	name = "figura de accion: Jr"
	desc = "Una figura de accion de Jr marca \"Manaos\". Hm..."
	icon = 'manaos/icons/obj/toy.dmi'
	icon_state = "jr"

/obj/item/toy/figure/danika
	name = "figura de accion: Danika"
	desc = "Una figura de accion de Danika marca \"Manaos\". Soy una Laakkonen, por el amor de Dios!"
	icon = 'manaos/icons/obj/toy.dmi'
	icon_state = "danika"

/obj/item/toy/figure/bruno
	name = "figura de accion: Bruno"
	desc = "Una figura de accion de Bruno marca \"Manaos\"."
	icon = 'manaos/icons/obj/toy.dmi'
	icon_state = "bruno"

/obj/item/toy/figure/ariel
	name = "figura de accion: Ariel"
	desc = "Una figura de accion de Ariel marca \"Manaos\". Wakala..."
	icon = 'manaos/icons/obj/toy.dmi'
	icon_state = "ariel"

/obj/item/toy/figure/alysson
	name = "figura de accion: Alysson"
	desc = "Una figura de accion de Alysson marca \"Manaos\". Ahora con cabello 100% natural."
	icon = 'manaos/icons/obj/toy.dmi'
	icon_state = "alysson"

/obj/item/toy/figure/darkness
	name = "figura de accion: Darkness"
	desc = "Una figura de accion de Darkness marca \"Manaos\". Parece a una tipo secuestrador con esa mascara, pero muy elegante."
	icon = 'manaos/icons/obj/toy.dmi'
	icon_state = "darkness"

/obj/item/toy/figure/zsle
	name = "figura de accion: Zsle"
	desc = "Una figura de accion de Zsle marca \"Manaos\"."
	icon = 'manaos/icons/obj/toy.dmi'
	icon_state = "zsle"

/obj/item/toy/figure/slimy
	name = "figura de accion: Slimy"
	desc = "Una figura de accion de Slimy marca \"Manaos\". Jum..."
	icon = 'manaos/icons/obj/toy.dmi'
	icon_state = "slimy"
	var/cooldown = 0
/obj/item/toy/figure/slimy/attack_self(mob/user as mob)
	if(cooldown < world.time - 8)
		playsound(user, 'manaos/sound/misc/slime_squish.ogg', 20, 1)
		cooldown = world.time
/obj/item/toy/figure/slimy/attack_hand(mob/user as mob)
	if(loc == user)
		if(cooldown < world.time - 8)
			playsound(user, 'manaos/sound/misc/slime_squish.ogg', 20, 1)
			cooldown = world.time
			return
	..()

/obj/item/toy/figure/dana
	name = "figura de accion: Dana"
	desc = "Una figura de accion de Dana marca \"Manaos\"."
	icon = 'manaos/icons/obj/toy.dmi'
	icon_state = "dana"

/obj/item/toy/figure/uzume
	name = "figura de accion: Uzume"
	desc = "Una figura de accion de Uzume marca \"Manaos\"."
	icon = 'manaos/icons/obj/toy.dmi'
	icon_state = "uzume"
	var/cooldown = 0
/obj/item/toy/figure/uzume/attack_self(mob/user as mob)
	if(cooldown < world.time - 8)
		playsound(user, 'manaos/sound/misc/slime_squish.ogg', 20, 1)
		cooldown = world.time
/obj/item/toy/figure/uzume/attack_hand(mob/user as mob)
	if(loc == user)
		if(cooldown < world.time - 8)
			playsound(user, 'manaos/sound/misc/slime_squish.ogg', 20, 1)
			cooldown = world.time
			return
	..()

/obj/item/toy/figure/suki
	name = "figura de accion: Suki"
	desc = "Una figura de accion de Suki marca \"Manaos\". Ow..."
	icon = 'manaos/icons/obj/toy.dmi'
	icon_state = "suki"
	var/cooldown = 0
/obj/item/toy/figure/suki/attack_self(mob/user as mob)
	if(cooldown < world.time - 8)
		playsound(user, 'manaos/sound/misc/slime_squish.ogg', 20, 1)
		cooldown = world.time
/obj/item/toy/figure/suki/attack_hand(mob/user as mob)
	if(loc == user)
		if(cooldown < world.time - 8)
			playsound(user, 'manaos/sound/misc/slime_squish.ogg', 20, 1)
			cooldown = world.time
			return
	..()

/obj/item/toy/figure/connor
	name = "figura de accion: Connor"
	desc = "Una figura de accion de Connor marca \"Manaos\".  Tiene \"wetskrell.nt\" escrito y tachado."
	icon = 'manaos/icons/obj/toy.dmi'
	icon_state = "connor"

/obj/item/toy/figure/camilo
	name = "figura de accion: Camilo"
	desc = "Una figura de accion de Camilo marca \"Manaos\"."
	icon = 'manaos/icons/obj/toy.dmi'
	icon_state = "camilo"

/obj/item/toy/figure/honkito
	name = "figura de accion: Honkito"
	desc = "Una figura de accion de Honkito marca \"Manaos\". HONK!!"
	icon = 'manaos/icons/obj/toy.dmi'
	icon_state = "honkito"
	var/cooldown = 0
/obj/item/toy/figure/honkito/attack_self(mob/user as mob)
	if(cooldown < world.time - 8)
		playsound(user, 'sound/items/bikehorn.ogg', 20, 1)
		cooldown = world.time
/obj/item/toy/figure/honkito/attack_hand(mob/user as mob)
	if(loc == user)
		if(cooldown < world.time - 8)
			playsound(user, 'sound/items/bikehorn.ogg', 20, 1)
			cooldown = world.time
			return
	..()

/obj/item/toy/figure/wh
	name = "figura de accion: WH-RL-W"
	desc = "Una figura de accion de WH-RL-W marca \"Manaos\"."
	icon = 'manaos/icons/obj/toy.dmi'
	icon_state = "wh"

/obj/item/toy/figure/louie
	name = "figura de accion: Louie"
	desc = "Una figura de accion de Louie marca \"Manaos\"."
	icon = 'manaos/icons/obj/toy.dmi'
	icon_state = "louie"

/obj/item/toy/figure/vaum
	name = "figura de accion: Vaum"
	desc = "Una figura de accion de Vaum marca \"Manaos\"."
	icon = 'manaos/icons/obj/toy.dmi'
	icon_state = "vaum"
	var/cooldown = 0
/obj/item/toy/figure/vaum/attack_self(mob/user as mob)
	if(cooldown < world.time - 8)
		playsound(user, 'manaos/sound/voice/chime.ogg', 20, 1)
		cooldown = world.time
/obj/item/toy/figure/vaum/attack_hand(mob/user as mob)
	if(loc == user)
		if(cooldown < world.time - 8)
			playsound(user, 'manaos/sound/voice/chime.ogg', 20, 1)
			cooldown = world.time
			return
	..()

/obj/item/toy/figure/eerika
	name = "figura de accion: Eerika"
	desc = "Una figura de accion de Eerika marca \"Manaos\". Booo~"
	icon = 'manaos/icons/obj/toy.dmi'
	icon_state = "eerika"

/obj/item/toy/figure/manuel
	name = "figura de accion: Manuel"
	desc = "Una figura de accion de Manuel marca \"Manaos\"."
	icon = 'manaos/icons/obj/toy.dmi'
	icon_state = "manuel"

/obj/item/toy/figure/kans
	name = "figura de accion: Kans"
	desc = "Una figura de accion de Kans marca \"Manaos\". LOOT!!"
	icon = 'manaos/icons/obj/toy.dmi'
	icon_state = "kans"

/obj/item/toy/figure/aleph
	name = "figura de accion: Aleph"
	desc = "Una figura de accion de Aleph marca \"Manaos\"."
	icon = 'manaos/icons/obj/toy.dmi'
	icon_state = "aleph"

/obj/item/toy/figure/priscilla
	name = "figura de accion: Priscilla"
	desc = "Una figura de accion de Priscilla marca \"Manaos\"."
	icon = 'manaos/icons/obj/toy.dmi'
	icon_state = "priscilla"

/obj/item/toy/figure/hal
	name = "figura de accion: Hal"
	desc = "Una figura de accion de Hal marca \"Manaos\"."
	icon = 'manaos/icons/obj/toy.dmi'
	icon_state = "hal"

/obj/item/toy/figure/sam
	name = "figura de accion: Sam"
	desc = "Una figura de accion de Sam marca \"Manaos\"."
	icon = 'manaos/icons/obj/toy.dmi'
	icon_state = "sam"

/obj/item/toy/figure/duck
	name = "figura de accion: Duck"
	desc = "Una figura de accion de Duck marca \"Manaos\". *sighs..."
	icon = 'manaos/icons/obj/toy.dmi'
	icon_state = "duck"

/obj/item/toy/figure/area
	name = "figura de accion: Area"
	desc = "Una figura de accion de Area marca \"Manaos\". Huele a sangre."
	icon = 'manaos/icons/obj/toy.dmi'
	icon_state = "area"

/obj/item/toy/figure/vlad
	name = "figura de accion: Vlad"
	desc = "Una figura de accion de Vlad marca \"Manaos\". C20-R viene por separado"
	icon = 'manaos/icons/obj/toy.dmi'
	icon_state = "vlad"

/obj/item/toy/figure/franco
	name = "figura de accion: Franco"
	desc = "Una figura de accion de Franco marca \"Manaos\"."
	icon = 'manaos/icons/obj/toy.dmi'
	icon_state = "franco"

/obj/item/toy/figure/angelina
	name = "figura de accion: Angelina"
	desc = "Una figura de accion de Angelina marca \"Manaos\"."
	icon = 'manaos/icons/obj/toy.dmi'
	icon_state = "angelina"

/obj/item/toy/figure/lazy
	name = "figura de accion: Lazy"
	desc = "Una figura de accion de Lazy marca \"Manaos\"."
	icon = 'manaos/icons/obj/toy.dmi'
	icon_state = "lazy"
	var/cooldown = 0
/obj/item/toy/figure/lazy/attack_self(mob/user as mob)
	if(cooldown < world.time - 8)
		playsound(user, 'manaos/sound/creatures/dog_bark1.ogg', 20, 1)
		cooldown = world.time
/obj/item/toy/figure/lazy/attack_hand(mob/user as mob)
	if(loc == user)
		if(cooldown < world.time - 8)
			playsound(user, 'manaos/sound/creatures/pug_bark1.ogg', 20, 1)
			cooldown = world.time
			return
	..()

/obj/item/toy/figure/gabriel
	name = "figura de accion: Gabriel"
	desc = "Una figura de accion de Gabriel marca \"Manaos\"."
	icon = 'manaos/icons/obj/toy.dmi'
	icon_state = "gabriel"
	var/cooldown = 0
/obj/item/toy/figure/gabriel/attack_self(mob/user as mob)
	if(cooldown < world.time - 8)
		playsound(user, 'sound/effects/sparks1.ogg', 20, 1)
		cooldown = world.time
/obj/item/toy/figure/gabriel/attack_hand(mob/user as mob)
	if(loc == user)
		if(cooldown < world.time - 8)
			playsound(user, 'sound/effects/sparks1.ogg', 20, 1)
			cooldown = world.time
			return
	..()

/obj/item/toy/figure/azazel
	name = "figura de accion: Azazel"
	desc = "Una figura de accion de Azazel marca \"Manaos\"."
	icon = 'manaos/icons/obj/toy.dmi'
	icon_state = "azazel"

/obj/item/toy/figure/iryna
	name = "figura de accion: Iryna"
	desc = "Una figura de accion de Iryna marca \"Manaos\"."
	icon = 'manaos/icons/obj/toy.dmi'
	icon_state = "iryna"
