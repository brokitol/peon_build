recolteur
module.exports = function (creep) {

	if(creep.energy < creep.energyCapacity) {
		var sources = creep.room.find(Game.SOURCES);
		creep.moveTo(sources[creep.memory.source]);
		creep.harvest(sources[creep.memory.source]);
	}
	else if (Game.spawns.Spawn1.energy < Game.spawns.Spawn1.energyCapacity) {
		creep.moveTo(Game.spawns.Spawn1);
		creep.transferEnergy(Game.spawns.Spawn1);
	}
	else {
	    //creep.moveTo(22,19);
	}
};
