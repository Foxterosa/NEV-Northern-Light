/mob/living/carbon/human/emote(var/act,var/m_type=1,var/message = null)
	var/param = null

	if (findtext(act, "-", 1, null))
		var/t1 = findtext(act, "-", 1, null)
		param = copytext(act, t1 + 1, length(act) + 1)
		act = copytext(act, 1, t1)

	if(findtext(act,"s",-1) && !findtext(act,"_",-2))//Removes ending s's unless they are prefixed with a '_'
		act = copytext(act,1,length(act))

	var/muzzled = istype(src.wear_mask, /obj/item/clothing/mask/muzzle) || istype(src.wear_mask, /obj/item/weapon/grenade)
	//var/m_type = 1

	for (var/obj/item/weapon/implant/I in src)
		if (I.implanted)
			I.trigger(act, src)

	if(src.stat == 2 && (act != "deathgasp"))
		return

	var/cloud_emote = ""

	switch(act)
		if ("airguitar")
			if (!src.restrained())
				message = "empieza a tocar una guitara imaginaria y a sacudir la cabeza como un mono en un safari."
				m_type = 1

		if ("blink")
			message = "pestañea."
			m_type = 1

		if ("blink_r")
			message = "pestañea rapidamente."
			m_type = 1

		if ("bow")
			if (!src.buckled)
				var/M = null
				if (param)
					for (var/mob/A in view(null, null))
						if (param == A.name)
							M = A
							break
				if (!M)
					param = null

				if (param)
					message = "hace una reverencia hacia [param]."
				else
					message = "hace una reverencia."
			m_type = 1

		if ("custom")
			var/input = sanitize(input("Choose an emote to display.") as text|null)
			if (!input)
				return
			var/input2 = input("Is this a visible or hearable emote?") in list("Visible","Hearable")
			if (input2 == "Visible")
				m_type = 1
			else if (input2 == "Hearable")
				if (src.miming)
					return
				m_type = 2
			else
				alert("Unable to use this emote, must be either hearable or visible.")
				return
			return custom_emote(m_type, message)

		if ("me")

			//if(silent && silent > 0 && findtext(message,"\"",1, null) > 0)
			//	return //This check does not work and I have no idea why, I'm leaving it in for reference.

			if (src.client)
				if (client.prefs.muted & MUTE_IC)
					to_chat(src, "\red You cannot send IC messages (muted).")
					return
				if (src.client.handle_spam_prevention(message,MUTE_IC))
					return
			if (stat)
				return
			if(!(message))
				return
			return custom_emote(m_type, message)

		if("pain")
			if(!message)
				if(miming)
					message = "parece estar en dolor!"
					m_type = 1 // Can't we get defines for these?
				else
					message = "se retuerse del dolor."
					m_type = 1

			cloud_emote = "cloud-pain"

		if ("salute")
			if (!src.buckled)
				var/M = null
				if (param)
					for (var/mob/A in view(null, null))
						if (param == A.name)
							M = A
							break
				if (!M)
					param = null

				if (param)
					message = "saluda a [param]."
				else
					message = "saluda."
			m_type = 1

		if ("choke")
			if(miming)
				message = "agarra su garganta desesperadamente!"
				m_type = 1
			else
				if (!muzzled)
					message = "se ahoga!"
					m_type = 2
				else
					message = "hace un ruido fuerte."
					m_type = 2

		if ("clap")
			if (!src.restrained())
				message = "aplaude."
				m_type = 2
				if(miming)
					m_type = 1
		if ("flap")
			if (!src.restrained())
				message = "agita sus alas."
				m_type = 2
				if(miming)
					m_type = 1

		if ("aflap")
			if (!src.restrained())
				message = "agita sus alas AGRESIVAMENTE!"
				m_type = 2
				if(miming)
					m_type = 1

		if ("drool")
			message = "babea."
			m_type = 1

		if ("eyebrow")
			message = "levanta una ceja."
			m_type = 1

		if ("chuckle")
			if(miming)
				message = "hace una carcajada silenciosa."
				m_type = 1
			else
				if (!muzzled)
					message = "suelta una risa."
					m_type = 2
				else
					message = "hace un sonido."
					m_type = 2

		if ("twitch")
			message = "tiembla violentamente."
			m_type = 1

		if ("twitch_s")
			message = "tiembla ligeramente."
			m_type = 1

		if ("faint")
			message = "se desmaya."
			if(src.sleeping)
				return //Can't faint while asleep
			src.sleeping += 10 //Short-short nap
			m_type = 1

		if ("cough")
			if(miming)
				message = "parece toser!"
				m_type = 1
			else
				if (!muzzled)
					message = "tose!"
					m_type = 2
				else
					message = "hace un ruido fuerte."
					m_type = 2

		if ("frown")
			message = "frunce el seño."
			m_type = 1

		if ("nod")
			message = "asiente."
			m_type = 1

		if ("blush")
			message = "se sonroja."
			m_type = 1

		if ("wave")
			message = "agita su mano en el aire."
			m_type = 1

		if ("gasp")
			if(miming)
				message = "parece estar jadeando por aire!"
				m_type = 1
			else
				if (!muzzled)
					message = "jadea!"
					m_type = 2
				else
					message = "hace un sonido debil."
					m_type = 2
			cloud_emote = "cloud-gasp"

		if ("deathgasp")
			if(stats.getPerk(PERK_TERRIBLE_FATE))
				message = "su cuerpo emite una extraña sensacion y de repente un frio invade tu cuerpo. el sonido de sus gritos antes de morir solo hacen eco en tu mente."  
			else           
				message = "[species.death_message]"
			m_type = 1

		if ("giggle")
			if(miming)
				message = "hace una risita silenciosa!"
				m_type = 1
			else
				if (!muzzled)
					message = "hace una risita."
					m_type = 2
				else
					message = "hace un sonido."
					m_type = 2

		if ("glare")
			var/M = null
			if (param)
				for (var/mob/A in view(null, null))
					if (param == A.name)
						M = A
						break
			if (!M)
				param = null

			if (param)
				message = "mira firmemente a [param]."
			else
				message = "mira firmemente."

		if ("stare")
			var/M = null
			if (param)
				for (var/mob/A in view(null, null))
					if (param == A.name)
						M = A
						break
			if (!M)
				param = null

			if (param)
				message = "observa a [param]."
			else
				message = "observa."

		if ("look")
			var/M = null
			if (param)
				for (var/mob/A in view(null, null))
					if (param == A.name)
						M = A
						break

			if (!M)
				param = null

			if (param)
				message = "mira a [param]."
			else
				message = "mira."
			m_type = 1

		if ("grin")
			message = "sonrie un poco."
			m_type = 1

		if ("cry")
			if(miming)
				message = "llora en silencio."
				m_type = 1
			else
				if (!muzzled)
					message = "llora."
					m_type = 2
				else
					message = "hace un sonido debil. [get_visible_gender() == MALE ? "el" : get_visible_gender() == FEMALE ? "ella" : "ellos"] [get_visible_gender() == NEUTER ? "frunce el seño" : "frunce el seño" ]."
					m_type = 2

		if ("sigh")
			if(miming)
				message = "parece suspirar."
				m_type = 1
			else
				if (!muzzled)
					message = "suspira."
					m_type = 2
				else
					message = "hace un sonido debil."
					m_type = 2

		if ("laugh")
			if(miming)
				message = "mimica reirse."
				m_type = 1
			else
				if (!muzzled)
					message = "rie."
					m_type = 2
				else
					message = "hace un sonido."
					m_type = 2

		if ("mumble")
			message = "balbucea algo!"
			m_type = 2
			if(miming)
				m_type = 1

		if ("grumble")
			if(miming)
				message = "gruñe!"
				m_type = 1
			if (!muzzled)
				message = "gruñe!"
				m_type = 2
			else
				message = "hace un sonido."
				m_type = 2

		if ("groan")
			if(miming)
				message = "parece quejarse!"
				m_type = 1
			else
				if (!muzzled)
					message = "suelta un quejido!"
					m_type = 2
				else
					message = "hace un sonido fuerte."
					m_type = 2

		if ("moan")
			if(miming)
				message = "parece gemir!"
				m_type = 1
			else
				message = "gime!"
				m_type = 2

		if ("johnny")
			var/M
			if (param)
				M = param
			if (!M)
				param = null
			else
				if(miming)
					message = "se saca el cigarillo de su boca y exhala \"[M]\" el humo." 
					m_type = 1
				else
					message = "dice, \"[M], por favor. El tenia una familia.\" [src.name] toma el cigarro de su boca y exhala el humo en su nombre."  
					m_type = 2

		if ("point")
			if (!src.restrained())
				var/mob/M = null
				if (param)
					for (var/atom/A as mob|obj|turf|area in view(null, null))
						if (param == A.name)
							M = A
							break

				if (!M)
					message = "apunta."
				else
					pointed(M)

				if (M)
					message = "apunta a [M]."
				else
			m_type = 1

		if ("raise")
			if (!src.restrained())
				message = "levanta la mano."
			m_type = 1

		if("shake")
			message = "sacude su cabeza."
			m_type = 1

		if ("shrug")
			message = "se encoge de hombros."
			m_type = 1

		if ("signal")
			if (!src.restrained())
				var/t1 = round(text2num(param))
				if (isnum(t1))
					if (t1 <= 5 && (!src.r_hand || !src.l_hand))
						message = "levanta [t1] dedo\s."
					else if (t1 <= 10 && (!src.r_hand && !src.l_hand))
						message = "levanta [t1] dedo\s."
			m_type = 1

		if ("smile")
			message = "sonrie."
			m_type = 1

		if ("shiver")
			message = "tiembla."
			m_type = 2
			if(miming)
				m_type = 1

		if ("pale")
			message = "se ve [get_visible_gender() == MALE ? "palido" : "palida"] por un momento."
			m_type = 1

		if ("tremble")
			message = "tiembla en miedo!"
			m_type = 1

		if ("sneeze")
			if (miming)
				message = "estornuda sin hacer ruido."
				m_type = 1
			else
				if (!muzzled)
					message = "estornuda."
					m_type = 2
				else
					m_type = 2

		if ("sniff")
			message = "olfatea." // quizas cambie este no estoy muy feliz con como esta
			m_type = 2
			if(miming)
				m_type = 1

		if ("snore")
			if (miming)
				message = "duerme profundamente."
				m_type = 1
			else
				if (!muzzled)
					message = "ronca."
					m_type = 2
				else
					message = "hace un sonido."
					m_type = 2

		if ("whimper")
			if (miming)
				message = "parece estar [get_visible_gender() == MALE ? "herido" : "herida"]."
				m_type = 1
			else
				if (!muzzled)
					message = "lloriquea."
					m_type = 2
				else
					message = "hace un sonido debil."
					m_type = 2

		if ("wink")
			message = "guiña."
			m_type = 1

		if ("yawn")
			if (!muzzled)
				message = "bosteza."
				m_type = 2
				if(miming)
					m_type = 1

		if ("collapse")
			Paralyse(2)
			message = "colapsa!"
			m_type = 2
			if(miming)
				m_type = 1

		if("hug")
			m_type = 1
			if (!src.restrained())
				var/M = null
				if (param)
					for (var/mob/A in view(1, null))
						if (param == A.name)
							M = A
							break
				if (M == src)
					M = null

				if (M)
					message = "abraza [M]."
				else
					message = "se abraza a [get_visible_gender() == MALE ? "si mismo" : "si misma" ]."

		if ("handshake")
			m_type = 1
			if (!src.restrained() && !src.r_hand)
				var/mob/M = null
				if (param)
					for (var/mob/A in view(1, null))
						if (param == A.name)
							M = A
							break
				if (M == src)
					M = null

				if (M)
					if (M.canmove && !M.r_hand && !M.restrained())
						message = "le da un apreton de manos a [M]."
					else
						message = "presenta su mano a [M]."

		if("dap")
			m_type = 1
			if (!src.restrained())
				var/M = null
				if (param)
					for (var/mob/A in view(1, null))
						if (param == A.name)
							M = A
							break
				if (M)
					message = "le da un saludo espacial a [M]."
				else
					message = "tristemente no pudiste encontrar a nadie con quien hacer el saludo espacial asi que te saludas a ti [get_visible_gender() == MALE ? "mismo" : "misma"]. Que vergonzoso."
                            
		if ("scream")
			if (miming)
				message = "actua un grito silencioso!"
				m_type = 1
			else
				if (!muzzled)
					message = "grita!"
					m_type = 2
				else
					message = "hace un ruido muy fuerte."
					m_type = 2
			cloud_emote = "cloud-scream"

		if ("help")
			to_chat(src, {"blink, blink_r, blush, bow-(none)/mob, burp, choke, chuckle, clap, collapse, cough,
cry, custom, deathgasp, drool, eyebrow, frown, gasp, giggle, groan, grumble, handshake, hug-(none)/mob, glare-(none)/mob,
grin, laugh, look-(none)/mob, moan, mumble, nod, pale, point-atom, raise, salute, shake, shiver, shrug,
sigh, signal-#1-10, smile, sneeze, sniff, snore, stare-(none)/mob, tremble, twitch, twitch_s, whimper,
wink, yawn, swish, sway/wag, fastsway/qwag, stopsway/swag"})

		else
			to_chat(src, "\blue Unusable emote '[act]'. Say *help for a list.")





	if (message)
		log_emote("[name]/[key] : [message]")
		custom_emote(m_type, message)

	if(cloud_emote)
		var/image/emote_bubble = image('icons/mob/emote.dmi', src, cloud_emote, ABOVE_MOB_LAYER)
		flick_overlay(emote_bubble, clients, 30)
		QDEL_IN(emote_bubble, 3 SECONDS)


/mob/living/carbon/human/verb/pose()
	set name = "Set Pose"
	set desc = "Sets a description which will be shown when someone examines you."
	set category = "IC"

	if(suppress_communication)
		return FALSE

	pose =  sanitize(input(usr, "This is [src]. [get_visible_gender() == MALE ? "He" : get_visible_gender() == FEMALE ? "She" : "They"] [get_visible_gender() == NEUTER ? "are" : "is"]...", "Pose", null)  as text)
