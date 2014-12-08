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
		memory.requete["ressource"][priorité][@name]["prendre_donner"] = prendre_donner

	creer_requete: (besoin, priorité, detail, ou) ->
		if Memory.requete[besoin] == undefined
			Memory.requete[besoin] = {}
		if Memory.requete[besoin][priorité] == undefined
			Memory.requete[besoin][priorité] = {}

		memory.requete[besoin][priorité][@name] = {}
		memory.requete[besoin][priorité][@name]["detail"] = detail
		memory.requete[besoin][priorité][@name]["ou"] = ou

		creer
		faire_requette
		repondre_requette
