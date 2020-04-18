//
//  Character.swift
//  CN-C
//
//  Created by Jean Pierre VALLS on 09/01/2020.
//  Copyright © 2020 Jean Pierre VALLS. All rights reserved.
//

import Foundation

//Creation of a character class
class Character {
    let name: String
    let weapon: Weapon
    var health: Int = 100
    
    init(name: String) {
        self.name = name
        self.weapon = Weapon.randomWeapon()   //initialize Weapon with random value
        
    }
    
    
    //Creation of a heal function to get back points
    func heal() {
        if self.health <= 80 {
            self.health += 20
        } else {
            self.health = 100
        }
        
    }
    
    
    func receive(damage: Int) {
        health -= damage
    }
    
    
    func isDead() -> Bool {
        return health <= 0
    }
}

