constructeur
module.exports = function (creep) {
    creep.memory.action = "libre";
    if(creep.energy === 0) {
        creep.memory.action = "recharge";
		creep.moveTo(Game.spawns.Spawn1);
		Game.spawns.Spawn1.transferEnergy(creep);
	}
	else {
		var targets = creep.room.find(Game.CONSTRUCTION_SITES);
		if(targets.length) {
            creep.memory.action = "construit";
            if (creep.pos.inRangeTo(targets[0].pos, 0))
                creep.moveTo(Game.spawns.Spawn1);
            else {
                creep.moveTo(targets[0]);
                creep.build(targets[0]);
            }
		}
	}
	if (creep.memory.action == "libre") {
        var struct = creep.room.find(Game.STRUCTURES, {filter:function(s) {return s.my === true || /*s.structureType == "road" ||*/ s.structureType == "constructedWall";}});
        for (var i in struct) {
            var s = struct[i];
            if (s.hits < s.hitsMax /*/ 2*/) {
                creep.memory.action = "repare";
                creep.moveTo(s);
                creep.repair(s);
            }
        }
	}
	if (creep.memory.action == "libre") {
        if(creep.energy <  creep.energyCapacity) {
            creep.memory.action = "recharge libre";
            creep.moveTo(Game.spawns.Spawn1);
            Game.spawns.Spawn1.transferEnergy(creep);
        }
        else
            creep.moveTo(30,25);
	}
};
