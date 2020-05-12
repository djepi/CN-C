//
//  Player.swift
//  CN-C
//
//  Created by Jean Pierre VALLS on 09/01/2020.
//  Copyright © 2020 Jean Pierre VALLS. All rights reserved.
//

import Foundation

//Creation of the player class with an empty array for the characters
final class Player {
    let name: String                    //Players's name
    var characters: [Character] = []    // It's the characters's array before initialisation
    
    init(name: String) {
        self.name = name
    }
    //Function that will indicate if one of a character is dead
    func isDead() -> Bool {
        return  characters[0].isDead() && characters[1].isDead() && characters[2].isDead()
    }
    
}
