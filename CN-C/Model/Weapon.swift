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
    
    var name: String {
        switch self {
        case .glock:
            return "Glock"
        case .colt:
            return "Colt"
        case .fusilAPompe:
            return "Shotgun"
        case .magnum:
            return "Magnum44"
        case .special:
            return "38Spécial"
        case .browning:
            return "Machine Gun"
        }
    }
    
}
//The WEAPON class contains a weapon type and damages
final class Weapon {
    let type: WeaponType
    let damage: Int
    
    init(type: WeaponType, damage: Int) {
        self.type = type
        self.damage = damage
    }
    //Static function with random choice of weapon and damages
    static func randomWeapon() -> Weapon {
        let randomType = WeaponType(rawValue: Int.random(in: 0 ..< WeaponType.allCases.count))!
        let randomDamage = Int.random(in: 15 ..< 31 )    //The damage will always be between 15 and 30 life pts
        return Weapon(type: randomType, damage: randomDamage)
    }
}
