soldat
module.exports = function (creep) {
    var targets = creep.room.find(Game.HOSTILE_CREEPS);
    if(targets.length >= 1) {
        creep.moveTo(targets[0]);
        creep.attack(targets[0]);
    }
    else {
        creep.moveTo(creep.room.find(Game.EXIT_TOP)[2])
    }
}
