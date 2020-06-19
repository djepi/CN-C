//
//  Player.swift
//  CN-C
//
//  Created by Jean Pierre VALLS on 09/01/2020.
//  Copyright © 2020 Jean Pierre VALLS. All rights reserved.
//

import Foundation

//Creation of class Player with an empty array for the characters
final class Player {
    let name: String                    //Players's name
    var characters: [Character] = []    // It's the characters's array before initialisation
    static let allCharacters: [Character] = [
        Character(name: "Pablo"),
        Character(name: "Rico"),
        Character(name: "Armando"),
        Character(name: "Ricky"),
        Character(name: "Tony"),
        Character(name: "Ricardo"),
        Character(name: "Al"),
        Character(name: "Vinnie"),
        Character(name: "Sony"),
        Character(name: "Bernardo"),
    ]
    
    //It's the array of characters that will be chosen
    static var choosedCharacters: [Character] = []
    
    init(name: String) {
        self.name = name
    }
    //Function that will indicate if one of a character is dead
    func isDead() -> Bool {
        return  characters[0].isDead() && characters[1].isDead() && characters[2].isDead()
    }
    
    //This function is used to create the 3 characters of each player
    func createCharacters() {
        for _ in 0...2 {
            createCharacter()
        }
    }
    
    //This function will be used to choose the characters of each player
    private func createCharacter() {
        print("\(self.name), Please, choose a character \(self.characters.count + 1) ?")
        for (index, character) in Player.allCharacters.enumerated() {
            print("\(index). \(character.name) - Weapon: \(character.weapon.type.name) (\(character.weapon.damage)pts)")
        }
        
        print("Enter a number\n")
        var choosedCharacter: Character?
        if let playerEntry = readLine(), !playerEntry.isEmpty, let index = Int(playerEntry), index < Player.allCharacters.count, index >= 0 {
            choosedCharacter = Player.allCharacters[index]
        } else {
            print("Please enter a valid number")
        }
        
        //If a player name already exists, the function indicates it and there is a return to the character's choice
        if let choosedCharacter = choosedCharacter, Player.choosedCharacters.contains(choosedCharacter) {
            print("This character is already used ! Choose another one")
            return createCharacter()
        }
        
        if let choosedCharacter = choosedCharacter {
            //Display a name to the 3 characters of each player, starting from zero and incrementing by 1, with "the count"
            print("The character \(choosedCharacter.name) is now yours")
            Player.choosedCharacters.append(choosedCharacter)
            characters.append(choosedCharacter)
        } else {
            print("An error occured, please choose a character")
            return createCharacters()
            
            
        }
    }
    func displayTeam () {
        for i in 0...2 {
            print("\n\(i+1). \(self.characters[i].name) Currently \(self.characters[i].health) life pts")
            
            
        }
    }
}
