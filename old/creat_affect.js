creat_affect
module.exports = function (room) {
    var liste = {};
    var nb_recolteur = 3;

    liste.transporteur3 = "transporteur";
    liste.transporteur2 = "transporteur";
    liste.transporteur1 = "transporteur";
    liste.batisseur3 = "batisseur";
    liste.batisseur2 = "batisseur";
    liste.batisseur1 = "batisseur";
    
    var modele = {};
    modele.recolteur = [Game.WORK, Game.CARRY, Game.CARRY, Game.MOVE, Game.MOVE];
    modele.soldat = [Game.MOVE, Game.MOVE, Game.ATTACK, Game.ATTACK, Game.MOVE];
    modele.batisseur = [Game.WORK, Game.MOVE, Game.CARRY, Game.CARRY, Game.MOVE];
    modele.big_batisseur = [Game.WORK, Game.WORK, Game.WORK, Game.CARRY, Game.CARRY, Game.CARRY, Game.CARRY, Game.MOVE, Game.MOVE, Game.MOVE, Game.MOVE, Game.MOVE, Game.MOVE, Game.MOVE]; //14 morceaux
    modele.transporteur = [Game.MOVE, Game.CARRY, Game.CARRY, Game.MOVE];
    
    for (var s in room.find(Game.SOURCES)) {
        for (var nb = 0; nb < nb_recolteur; nb++) {
            if (Game.creeps["recolteur " + nb + " " + s]) {
                Game.creeps["recolteur " + nb + " " + s].memory.source = s;
                Game.creeps["recolteur " + nb + " " + s].memory.role = "recolteur";
            }
            else {Game.spawns.Spawn1.createCreep( modele.recolteur, "recolteur " + nb + " " + s);}
        }
    }
    
    for (var c in liste) {
        var peon = Game.creeps[c];
        
        if (peon) {peon.memory.role = liste[c];}
        else {Game.spawns.Spawn1.createCreep( modele[liste[c]], c );}
    }
};
