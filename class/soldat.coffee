class Soldat extends Peon
	constructor: (@name, @priorité) ->
		super @name

	sous_run: ->
		target = @creep.pos.findNearest(Game.HOSTILE_CREEPS)
		if target
			@creep.moveTo(target)
			@creep.attack(target)
		else
			@creep.moveTo(@creep.room.find(Game.EXIT_TOP)[2])

	creer: () ->
		requete = super "creer", @priorité
