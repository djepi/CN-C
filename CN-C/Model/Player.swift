//
//  Player.swift
//  CN-C
//
//  Created by Jean Pierre VALLS on 09/01/2020.
//  Copyright © 2020 Jean Pierre VALLS. All rights reserved.
//

import UIKit

enum PlayerType: Int {
    case cartel
    case cosaNostra

    func characters() -> [Character]{
        if self == PlayerType.cartel{
            return [Character(name: "Rico"), Character(name: "Pablo"), Character(name: "Armando")]
            
        }
        return [Character(name: "Tony"), Character(name: "Jimmy"), Character(name: "Ricky")]
        
    }
}

class Player {
    var name: String
    var type: PlayerType
    var characters: [Character]
    
    init(name: String, type: PlayerType) {
        self.name = name
        self.type = type
        self.characters = type.characters()
    }

}
