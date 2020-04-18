//
//  main.swift
//  CN-C
//
//  Created by Jean Pierre VALLS on 24/02/2020.
//  Copyright © 2020 Jean Pierre VALLS. All rights reserved.
//

import Foundation

//The first thing that appears when de game is launched
print("Welcome to CosaNostra VS Cartel \n")

var game: Game = Game.startGame()

game.createTeams() //Call function createdTeams
game.startBattle() //Call function startBattle
