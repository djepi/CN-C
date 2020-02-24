//
//  Weapon.swift
//  CN-C
//
//  Created by Jean Pierre VALLS on 13/01/2020.
//  Copyright © 2020 Jean Pierre VALLS. All rights reserved.
//

import UIKit

//Cas

enum WeaponType: Int, CaseIterable {
    case glock
    case colt
    case fusilAPompe
    case magnum
    case special
    case browning
}

class Weapon {
    var type: WeaponType
    var damage: Int
    
    init(type: WeaponType, damage: Int) {
        self.type = type
        self.damage = damage
        
    }
    
    static func randomWeapon() -> Weapon {
        let randomType = WeaponType(rawValue: Int.random(in: 0 ..< WeaponType.allCases.count))!
        let randomDamage = Int.random(in: 0 ..< 21 )
        return Weapon(type: randomType, damage: randomDamage)
    }
}
