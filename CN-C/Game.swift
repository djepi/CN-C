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
        print("Enter player name 1")
        let player1Name = readLine() ?? "Cosa Nostra"
        let player1 = Player(name: player1Name)
        
        print("\nEnter player name 2")
        let player2Name = readLine() ?? "Cartel"
        let player2 = Player(name: player2Name)
        
        return Game(player1: player1, player2: player2)
    }
    func createTeams() {
        let player1Character1 = createCharacter(player: player1, fallBack: "TONY")
        player1.characters.append(player1Character1)
        let player1Character2 = createCharacter(player: player1, fallBack: "JIMMY")
        player1.characters.append(player1Character2)
        let player1Character3 = createCharacter(player: player1, fallBack: "RICKY")
        player1.characters.append(player1Character3)
        let player2Character1 = createCharacter(player: player2, fallBack: "RICO")
        player2.characters.append(player2Character1)
        let player2Character2 = createCharacter(player: player2, fallBack: "PABLO")
        player2.characters.append(player2Character2)
        let player2Character3 = createCharacter(player: player2, fallBack: "ARMANDO")
        player2.characters.append(player2Character3)
        
    }
    
    func createCharacter(player: Player, fallBack: String) -> Character {
        print("\n\(player.name), what is your character's name \(player.characters.count + 1) ?")
        var characterName = fallBack
        if let playerEntry = readLine(), !playerEntry.isEmpty {
            //Le nom de mon personnage est stocké dans playerEntry
            characterName = playerEntry
        }
        if self.names.contains(characterName) {
            print("This name is already used ! Choose another one")
            return createCharacter(player: player, fallBack: fallBack)
        }
        print("Your character \(player.characters.count + 1) is called \(characterName)")
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
        print("\nIt's your turn \(player.name) !")
        chooseCharacter(player: player, receiver: receiver)
        
    }
    
    func chooseCharacter(player: Player, receiver: Player) {
        print("Which character do you want to play with ?"
            + "\n1. \(player.characters[0].name) Currently \(player.characters[0].health) life pts"
            + "\n2. \(player.characters[1].name) Currently \(player.characters[1].health) life pts"
            + "\n3. \(player.characters[2].name) Currently \(player.characters[2].health) life pts")
        var choosedCharacter: Character!
        
        if let choice = readLine() {
            switch choice {
            case "1":
                if player.characters[0].isDead() != true {
                    choosedCharacter = player.characters[0]
                } else {
                    print("\nYou can't choose a dead character")
                    chooseCharacter(player: player, receiver: receiver)
                    return
                }
            case "2":
                choosedCharacter = player.characters[1]
            case "3":
                choosedCharacter = player.characters[2]
            default:
                print("I do not understand")
                 chooseCharacter(player: player, receiver: receiver)
                return
            }
            
        }
        makeAction(character: choosedCharacter, receiver: receiver)
        
    }
    
    func makeAction(character: Character, receiver: Player) {
        print("\nWhat do you want to do with \(character.name) ?"
            + "\n1. Attack ?"
            + "\n2. To heal ?")
        if let choice = readLine() {
            switch choice {
            case "1":
                attackPlayer(receiver: receiver, attacker: character)// choosedCharacter = player.characters![0]
            case "2":
                character.heal()
            default:
                print("I do not understand")
                makeAction(character: character, receiver: receiver)
                return
            }
        }
    }
    
        
    
    
    func attackPlayer(receiver: Player, attacker: Character) {
        print("\nWich opposing character do you want to attack ?"
            + "\n1. \(receiver.characters[0].name) Currently \(receiver.characters[0].health) life pts"
            + "\n2. \(receiver.characters[1].name) Currently \(receiver.characters[1].health) life pts"
            + "\n3. \(receiver.characters[2].name) Currently \(receiver.characters[2].health) life pts")
        
        var choosedReceiver: Character!
        
        if let choice = readLine() {
                switch choice {
                case "1":
                    if receiver.characters[0].isDead() != true {
                        choosedReceiver = receiver.characters[0]
                    } else {
                        print("You can't attack someone who's dead")
                        attackPlayer(receiver: receiver, attacker: attacker)
                        return
                        
                    }
                    
                case "2":
                    choosedReceiver = receiver.characters[1]
                case "3":
                    choosedReceiver = receiver.characters[2]
                default:
                    print("I do not understand")
                    attackPlayer(receiver: receiver, attacker: attacker)
                    return
                }
                
            }
            
            choosedReceiver.receive(damage: attacker.weapon.damage)
            print("\(choosedReceiver.name) just got a \(attacker.name) attack and lose \(attacker.weapon.damage) life pts")
            
        if choosedReceiver.isDead() {
                print("\(choosedReceiver.name) is dead !")
                
            }
        
        func displayWinner() {
            
        }
        
    }
}



