//
//  Game.swift
//  CN-C
//
//  Created by Jean Pierre VALLS on 24/02/2020.
//  Copyright © 2020 Jean Pierre VALLS. All rights reserved.
//

import Foundation

//The GAME class contains all the mechanical logic of the game
final class Game {
    var player1: Player
    var player2: Player
    var isGameRunning = true
    var counter = 0
    
    init(player1: Player, player2: Player) {
        self.player1 = player1
        self.player2 = player2
    }
    //Static function which defines the players's name and which will also give a name if you press the enter key
    static func startGame() -> Game {
        print("Enter player name 1")
        var playerName = "Cosa Nostra"
        if let player1Name = readLine(), !player1Name.isEmpty {
            playerName = player1Name
        } else {
            print("Your name will be \(playerName)")
        }
        let player1 = Player(name: playerName)
        
        print("\nEnter player name 2")
        playerName = "Cartel"
        if let player2Name = readLine(), !player2Name.isEmpty {
            playerName = player2Name
        } else{
            print("Your name will be \(playerName)")
        }
        let player2 = Player(name: playerName)
        
        return Game(player1: player1, player2: player2)
    }
    //Function that creates the characters'name for each player (Teams: 3 characters for 2 players).
    func createTeams() {
        player1.createCharacters()
        player2.createCharacters()
    }
    
    //Function which is used to start counting laps
    func startBattle() {
        while isGameRunning {
            counter = counter + 1
            playRound()
        }
    }
    //This function will tell who to play - The player's turn
    private func playRound() {
        let result = counter % 2
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
    //Function which makes a chest appear randomly at the player's turn
    private func shouldDisplayChest(character: Character) {
        let randomNumber = Int.random(in: 0...4)
        if randomNumber == 2 {
            let newWeapon = Weapon.randomWeapon()
            character.weapon = newWeapon
            print("Yeah ! A chest just appear for \(character.name) !")
            print("This chest contains a new weapon. It's \(newWeapon.type.name) and it gives \(newWeapon.damage) pts")
        }
    }
    //Function to choose the character with who the player wants to play
    private func chooseCharacter(player: Player, receiver: Player) {
        print("Which character do you want to play with ?"
            //Displays the characters's names and their life points
            + "\n1. \(player.characters[0].name) Currently \(player.characters[0].health) life pts"
            + "\n2. \(player.characters[1].name) Currently \(player.characters[1].health) life pts"
            + "\n3. \(player.characters[2].name) Currently \(player.characters[2].health) life pts")
        var choosedCharacter: Character!
        
        if let choice = readLine() {
            switch choice {
            case "1":
                if player.characters[0].isDead() != true {  //The character is alive
                    choosedCharacter = player.characters[0]
                } else {                                        //The character is dead
                    print("\nYou can't choose a dead character !")
                    chooseCharacter(player: player, receiver: receiver)
                    return
                }
            case "2":
                if player.characters[1].isDead() != true {
                    choosedCharacter = player.characters[1]
                } else {
                    print("\nYou can't choose a dead character !")
                    chooseCharacter(player: player, receiver: receiver)
                    return
                }
            case "3":
                if player.characters[2].isDead() != true {
                    choosedCharacter = player.characters[2]
                } else {
                    print("\nYou can't choose a dead character !")
                    chooseCharacter(player: player, receiver: receiver)
                    return
                }
                
            default:
                print("I do not understand... You can only choose 1, 2 or 3")
                chooseCharacter(player: player, receiver: receiver)
                return
            }
            
        }
        shouldDisplayChest(character: choosedCharacter)
        makeAction(character: choosedCharacter, receiver: receiver)
        
    }
    //Function where we choose to attack or heal
    private func makeAction(character: Character, receiver: Player) {
        print("\nWhat do you want to do with \(character.name) ?"
            + "\n1. Attack ?"
            + "\n2. To heal ?")
        if let choice = readLine() {
            switch choice {
            case "1":
                attackPlayer(receiver: receiver, attacker: character)
            case "2":
                character.heal()
            default:
                print("I do not understand... You can choose only 1 or 2")
                makeAction(character: character, receiver: receiver)
                return
            }
        }
    }
    //Function which chooses the opposing character to attack and which launches the attack
    private func attackPlayer(receiver: Player, attacker: Character) {
        print("\nWich opposing character do you want to attack ?"
            + "\n1. \(receiver.characters[0].name) Currently \(receiver.characters[0].health) life pts"
            + "\n2. \(receiver.characters[1].name) Currently \(receiver.characters[1].health) life pts"
            + "\n3. \(receiver.characters[2].name) Currently \(receiver.characters[2].health) life pts")
        
        var choosedReceiver: Character!
        
        if let choice = readLine() {
            switch choice {
            case "1":
                if receiver.characters[0].isDead() != true { //receiver.characters is alive
                    choosedReceiver = receiver.characters[0]
                } else {
                    print("You can't attack a dead character !")    //receiver.characters is dead
                    attackPlayer(receiver: receiver, attacker: attacker)
                    return
                }
                
            case "2":
                if receiver.characters[1].isDead() != true {
                    choosedReceiver = receiver.characters[1]
                } else {
                    print("You can't attack a dead character !")
                    attackPlayer(receiver: receiver, attacker: attacker)
                    return
                }
                
            case "3":
                if receiver.characters[2].isDead() != true {
                    choosedReceiver = receiver.characters[2]
                } else {
                    print("You can't attack a dead character !")
                    attackPlayer(receiver: receiver, attacker: attacker)
                    return
                }
                
            default:
                print("I do not understand... You can only choose 1, 2 or 3")
                attackPlayer(receiver: receiver, attacker: attacker)
                return
            }
            
        }
        //Tell us who was attacked, by who, with which weapon and damage points
        choosedReceiver.receive(damage: attacker.weapon.damage)
        print("\(choosedReceiver.name) just got a \(attacker.name) attack with a \(attacker.weapon.type.name), and lose \(attacker.weapon.damage) life pts")
        
        if choosedReceiver.isDead() {
            print("\(choosedReceiver.name) is dead now !")
        }
        
        if receiver.isDead() {
            displayWinner()
        }
    }
    //Function that will display the winner
    private func displayWinner() {
        isGameRunning = false
        
        if player1.isDead() {
            print("\(player2.name), YOU WIN THE WAR !!!")
        } else {
            print("\(player1.name), YOU WIN THE WAR !!!")
        }
        
    }
    //Function that will display the requested game statistics
    func showStatistics() {
        //Display number of rounds in the game
        print("In this party, there were \(counter) rounds")
        //Displays the names of player1's characters, their remaining life points, and the weapon used
        print("Here are some stats for \(player1.name) :"
            + "\n For \(player1.characters[0].name), \(player1.characters[0].health) life pts left and his LoveMachine is a \(player1.characters[0].weapon.type.name)"
            + "\n For \(player1.characters[1].name), \(player1.characters[1].health) life pts left and his LoveMachine is a \(player1.characters[1].weapon.type.name)"
            + "\n For \(player1.characters[2].name), \(player1.characters[2].health) life pts left and his LoveMachine is a \(player1.characters[2].weapon.type.name)",
            
            ////Displays the names of player2's characters, their remaining life points, and the weapon used
            "\nHere are some stats for \(player2.name) :"
                + "\n For \(player2.characters[0].name), \(player2.characters[0].health) life pts left and his LoveMachine is a \(player2.characters[0].weapon.type.name)"
                + "\n For \(player2.characters[1].name), \(player2.characters[1].health) life pts left and his LoveMachine is a \(player2.characters[1].weapon.type.name)"
                + "\n For \(player2.characters[2].name), \(player2.characters[2].health) life pts left and his LoveMachine is a \(player2.characters[2].weapon.type.name)")
        
    }
    //Function which indicates the end of the game and which displays the game's statistics
    func endGame() {
        if player1.isDead() || player2.isDead() {
            print("\nEND OF GAME")
        }
    }
    
}
