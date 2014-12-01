class Peon
	constructor: (@name) ->
		@creep = Game.creeps[@name]

	run: ->
		if @creep == null
			this.creer()
		else
			this.sous_run()

	sous_run: () ->
		#a surcharger

	creer_requete: (besoin, priorité) ->
		if Memory.requete[besoin] == undefined
			Memory.requete[besoin] = {}
		if Memory.requete[besoin][priorité] == undefined
			Memory.requete[besoin][priorité] = {}

		memory.requete[besoin][priorité][@name] = {}
