/datum/chemical_reaction/batter
	result = "batter"
	required_reagents = list("egg" = 3, "flour" = 5, "milk" = 5)
	result_amount = 10
	mix_message = "The solution thickens into a glossy batter."

/datum/chemical_reaction/cakebatter
	result = "cake_batter"
	required_reagents = list("sugar" = 1, "batter" = 2)
	result_amount = 3

/datum/chemical_reaction/soybatter
	result = "vegan_batter"
	required_reagents = list("tofu" = 3, "flour" = 5, "milk" = 5)
	result_amount = 10