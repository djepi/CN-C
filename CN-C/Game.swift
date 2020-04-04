//
//  Game.swift
//  CN-C
//
//  Created by Jean Pierre VALLS on 24/02/2020.
//  Copyright © 2020 Jean Pierre VALLS. All rights reserved.
//

import Foundation

class Game {
    var player1: Player
    var player2: Player
    var names: [String] = []
    
    init(player1: Player, player2: Player) {
        self.player1 = player1
        self.player2 = player2
    }
    
    static func startGame() -> Game {
        print("Saisissez le nom du joueur 1")
        let player1Name = readLine() ?? "Cosa Nostra"
        let player1 = Player(name: player1Name)
        
        print("Saisissez le nom du joueur 2")
        let player2Name = readLine() ?? "Cartel"
        let player2 = Player(name: player2Name)
        
        return Game(player1: player1, player2: player2)
    }
    func createTeams() {
        let player1Character1 = createCharacter(player: player1, fallBack: "Tony")
        player1.characters.append(player1Character1)
        let player1Character2 = createCharacter(player: player1, fallBack: "Jimmy")
        player1.characters.append(player1Character2)
        let player1Character3 = createCharacter(player: player1, fallBack: "Ricky")
        player1.characters.append(player1Character3)
        let player2Character1 = createCharacter(player: player2, fallBack: "Rico")
        player2.characters.append(player2Character1)
        let player2Character2 = createCharacter(player: player2, fallBack: "Pablo")
        player2.characters.append(player2Character2)
        let player2Character3 = createCharacter(player: player2, fallBack: "Armando")
        player2.characters.append(player2Character3)
        
    }
 
    func createCharacter(player: Player, fallBack: String) -> Character {
        print("\(player.name), quel est le nom de votre personnage n\(player.characters.count + 1) ?")
        var characterName = fallBack
        if let playerEntry = readLine(), !playerEntry.isEmpty {
            //Le nom de mon personnage est stocké dans playerEntry
            characterName = playerEntry
        }
        if self.names.contains(characterName) {
            print("Ce nom est déjà utilisé ! Choisissez-en un autre")
            return createCharacter(player: player, fallBack: fallBack)
        }
        print("Votre perso s'appelle \(characterName)")
        names.append(characterName)
        return Character(name: characterName)
        
       
        
    }
    
    func startBattle() {
        var counter = 0
        while true {
            counter = counter + 1
            playRound(round: counter)
        }
    }
    
    func playRound(round: Int) {
        let result = round % 2
        var player: Player!
        var receiver: Player!
        
        if result == 0 {
            player = player2
            receiver = player1
        } else {
            player = player1
            receiver = player2
        }
        print("C'est ton tour \(player.name)!")
        chooseCharacter(player: player, receiver: receiver)
        
    }
    
    func chooseCharacter(player: Player, receiver: Player) {
        print("Avec quel personnage souhaites-tu jouer ?"
            + "\n1. \(player.characters[0].name)"
            + "\n2. \(player.characters[1].name)"
            + "\n3. \(player.characters[2].name)")
        var choosedCharacter: Character!
        
        if let choice = readLine() {
            switch choice {
            case "1":
                choosedCharacter = player.characters[0]
            case "2":
                choosedCharacter = player.characters[1]
            case "3":
                choosedCharacter = player.characters[2]
            default:
                print("Je ne comprends pas")
                return
            }

        }
        makeAction(character: choosedCharacter, receiver: receiver)

    }
    
    func makeAction(character: Character, receiver: Player) {
        print("Que souhaites-tu faire avec \(character.name) ?"
            + "\n1. Attaquer ?"
            + "\n2. Se soigner ?")
        if let choice = readLine() {
            switch choice {
            case "1":
            attackPlayer(receiver: receiver, with: character)// choosedCharacter = player.characters![0]
            case "2":
                character.heal()
            default:
                print("Je ne comprends pas")
                makeAction(character: character, receiver: receiver)
                return
            }
        }
    }
    
    func attackPlayer(receiver: Player, with attacker: Character) {
        //Demande au joueur quel caractère de l'équipe adverse (receiver) il veut attaquer - implémzenter le switch + le defaut (je ne comprends pas) - rajouter un break popur la compilation
        
    }
    
    func displayWinner() {
        
    }
}


