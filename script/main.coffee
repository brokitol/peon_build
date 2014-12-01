spawn = Game.spawns.Spawn1
room = spawn.room
if Memory.requete == undefined
	Memory.requete = {}

liste = {}
nb_recolteur = 6

soldat = {}
soldat.role = "soldat"
soldat.modele = "soldat"
soldat.nb = 10
liste.soldat = soldat

modele = {}
modele.recolteur = [Game.WORK, Game.CARRY, Game.MOVE, Game.MOVE]
modele.soldat = [Game.TOUGH, Game.MOVE, Game.MOVE, Game.ATTACK, Game.ATTACK]

for source_name, source of room.find(Game.SOURCES)
	for nb in [1..nb_recolteur]
		if Game.creeps["recolteur " + nb + " " + source_name]
			Game.creeps["recolteur " + nb + " " + source_name].memory.source = source_name
			Game.creeps["recolteur " + nb + " " + source_name].memory.role = "recolteur"

for name, dico of liste
	i = dico.nb
	for nb in [0..i]
		peon = Game.creeps[name + nb]
		if peon
			peon.memory.role = dico.role

create_recolteur = () ->
	for source_name, source of room.find(Game.SOURCES)
		for nb in [1..nb_recolteur]
			if Game.creeps["recolteur " + nb + " " + source_name]
				Game.creeps["recolteur " + nb + " " + source_name].memory.source = source_name
				Game.creeps["recolteur " + nb + " " + source_name].memory.role = "recolteur"
			else
				spawn.createCreep( modele.recolteur, "recolteur " + nb + " " + source_name)

create_soldat = () ->
	for name, dico of liste
		i = dico.nb
		for nb in [0..i]
			peon = Game.creeps[name + nb]
			if peon
				peon.memory.role = dico.role
			else
				spawn.createCreep(modele[dico.modele], name + nb)

create_recolteur()
create_soldat()

s = 0
r = 0
for nom, c of Game.creeps
	if c.role == "soldat"
		s++
	else
		r++

if r < 3
	create_recolteur()
else if (r - 3) < s * 2
	create_recolteur()
else
	create_soldat()

for nom, c of Game.creeps
	if c.memory.role == "recolteur"
		tmp = new Recolteur nom
		tmp.run()
	if c.memory.role == "soldat"
		tmp = new Soldat nom
		tmp.run()
