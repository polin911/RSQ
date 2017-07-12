//
//  Player.swift
//  RybaSushiQuize
//
//  Created by Polina on 20.06.17.
//  Copyright © 2017 Polina. All rights reserved.
//

import Foundation

class Player {
    
    var playerName: String = ""
    var playerScore: Int   = 0
    var wchiGame = ["Игра на роллы", "Игра на суши", "Игра на устрицы с шампанским" ]
    var nameGame = ""
    
    var winGame = ""
    
    var totalQuestion = 0
    var winnerScore   = 0
    var soSoScore     = [0]
    var looserScore   = 0
}
