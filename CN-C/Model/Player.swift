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
    
    static var names: [String] = []
    
    init(name: String) {
        self.name = name
    }
    //Function that will indicate if one of a character is dead
    func isDead() -> Bool {
        return  characters[0].isDead() && characters[1].isDead() && characters[2].isDead()
    }
    
    //This function will be used to choose the name of the characters of each player
    func createCharacter(fallBack: String) {
        print("\n\(self.name), what is your character's name \(self.characters.count + 1) ?")
        //If you press the ENTER key, a default name is automatically assigned, with the parameter "fallback"
        var characterName = fallBack
        if let playerEntry = readLine(), !playerEntry.isEmpty {
            //The character's name is stored in playerEntry, if I choose it myself
            characterName = playerEntry
        }
        //If a player name already exists, the function indicates it and there is a return to the character's choice
        if Player.names.contains(characterName) {
            print("This name is already used ! Choose another one")
            return createCharacter(fallBack: fallBack)
        }
        //Display a name to the 3 characters of each player, starting from zero and incrementing by 1, with "the count"
        print("Your character \(self.characters.count + 1) is called \(characterName)")
        Player.names.append(characterName)
        characters.append(Character(name: characterName))
        
    }
}
