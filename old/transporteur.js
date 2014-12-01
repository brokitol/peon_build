transporteur
module.exports = function (creep) {
    creep.memory.action = "libre";
    if(creep.energy === 0) {
		creep.moveTo(Game.spawns.Spawn1);
		Game.spawns.Spawn1.transferEnergy(creep);
		creep.memory.action = "chargement";
	}
	else {
		var targets = creep.room.find(Game.MY_STRUCTURES);
		for (var i in targets) {
            var s = targets[i];
            if (s.structureType == "extension")
            {
                if (s.energy < s.energyCapacity)
                {
                    creep.moveTo(s);
                    creep.transferEnergy(s);
                    creep.memory.action = "transfert";
                }
            }
		}
	}
	if (creep.memory.action === "libre")
	{
	    creep.moveTo(19,35);
	}
};
