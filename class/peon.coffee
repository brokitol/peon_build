class Peon
	constructor: (@name, @plan) ->
		@creep = Game.creeps[@name]

	run: ->
		if @creep == null
			this.creer()
		else
			this.sous_run()

	sous_run: () ->
		#a surcharger

	requette_creation: (priorité) ->
		creer_requete("creer", priorité, @plan, undefined)

	requette_ressource: (priorité, quantité, ou, prendre_donner) ->
		creer_requete("ressource", priorité, quantité, ou)
		Memory.requete["ressource"][priorité][@name]["prendre_donner"] = prendre_donner

	creer_requete: (besoin, priorité, detail, ou) ->
		if Memory.requete[besoin] == undefined
			Memory.requete[besoin] = {}
		if Memory.requete[besoin][priorité] == undefined
			Memory.requete[besoin][priorité] = {}

		Memory.requete[besoin][priorité][@name] = {}
		Memory.requete[besoin][priorité][@name]["detail"] = detail
		Memory.requete[besoin][priorité][@name]["ou"] = ou

	repondre_requete: (besoin, priorité, name, detail) ->
		if Memory.requete[besoin] == undefined
			return false
		if Memory.requete[besoin][priorité] == undefined
			return false
		if Memory.requete[besoin][priorité][name] == undefined
			return false

		if Memory.requete[besoin][priorité][name]["hero"] == undefined
			Memory.requete[besoin][priorité][name]["hero"] == {}

		Memory.requete[besoin][priorité][name]["hero"][@name] == detail
		return true

	repondre_requette_ressource: (priorité, name, quantité) ->
		repondre_requete("ressource", priorité, name, quantité)
