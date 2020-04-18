//
//  Player.swift
//  CN-C
//
//  Created by Jean Pierre VALLS on 09/01/2020.
//  Copyright © 2020 Jean Pierre VALLS. All rights reserved.
//

import Foundation

//Creation of a player class
class Player {
    let name: String
    var characters: [Character] = []
    
    init(name: String) {
        self.name = name
    }
    
    func isDead() -> Bool {
        return  characters[0].isDead() && characters[1].isDead() && characters[2].isDead()
    }
    
}
