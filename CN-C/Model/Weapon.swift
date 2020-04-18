//
//  Weapon.swift
//  CN-C
//
//  Created by Jean Pierre VALLS on 13/01/2020.
//  Copyright © 2020 Jean Pierre VALLS. All rights reserved.
//

import Foundation


//Enumeration of all weapons in the game
enum WeaponType: Int, CaseIterable {
    case glock
    case colt
    case fusilAPompe
    case magnum
    case special
    case browning
}

//Creation of a weapon class with constants and initialization of them
class Weapon {
    let type: WeaponType
    let damage: Int
    
    init(type: WeaponType, damage: Int) {
        self.type = type
        self.damage = damage
    }
    
    //Creation of a function with random choice of weapon and damage
    static func randomWeapon() -> Weapon {
        let randomType = WeaponType(rawValue: Int.random(in: 0 ..< WeaponType.allCases.count))!
        let randomDamage = Int.random(in: 0 ..< 21 )
        return Weapon(type: randomType, damage: randomDamage)
    }
}
