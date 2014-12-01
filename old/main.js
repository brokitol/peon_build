var recolteur = require('recolteur');
var soldat = require('soldat');
var constructeur = require('constructeur');
var transporteur = require('transporteur');
var ca = require("creat_affect");

ca(Game.spawns.Spawn1.room);

for(var c in Game.creeps) {
	var creep = Game.creeps[c];

	if(creep.memory.role == 'recolteur') {recolteur(creep);}
	if(creep.memory.role == 'soldat') {soldat(creep);}
	if(creep.memory.role == 'batisseur') {constructeur(creep);}
	if(creep.memory.role == 'transporteur') {transporteur(creep);}
}
