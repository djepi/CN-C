//
//  Character.swift
//  CN-C
//
//  Created by Jean Pierre VALLS on 09/01/2020.
//  Copyright © 2020 Jean Pierre VALLS. All rights reserved.
//

import UIKit

class Character {
    var name: String
    var weapon: Weapon
    
    init(name: String) {
        self.name = name
        self.weapon = Weapon.randomWeapon()   //initialiser Weapon avec une valeur aléatoire

    }

}
