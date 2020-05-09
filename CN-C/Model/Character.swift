//
//  Character.swift
//  CN-C
//
//  Created by Jean Pierre VALLS on 09/01/2020.
//  Copyright © 2020 Jean Pierre VALLS. All rights reserved.
//

import Foundation

//The creation of the Character class gives a name, a weapon and health for each character
class Character {
    let name: String
    var weapon: Weapon
    var health: Int = 100   //Here, health is predefined
    
    init(name: String) {
        self.name = name
        self.weapon = Weapon.randomWeapon()   //initialize Weapon with random value
        
    }
    //Creation of a heal function to get life points back
    //If you want to heal a character when his life points are between 80 and infinity, the game will display 100 life pts
    //From 79 life pts, if you heal, the game will add 20 pts
    func heal() {
        if self.health >= 80 {
            self.health = 100
        }   else {
            self.health += 20
        }
        
    }
    //Creation of a function to remove life points
    func receive(damage: Int) {
        health -= damage
        if health < 0 {
            health = 0      //From 0 life pts to negative infinity, the game will display 0 life pts
        }
    }
    
    //which indicates that a character is dead if his health is equal to or less than zero
    func isDead() -> Bool {
        return health <= 0
    }
}
