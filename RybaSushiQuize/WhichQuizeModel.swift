//
//  WhichQuizeModel.swift
//  RybaSushiQuize
//
//  Created by Polina on 14.06.17.
//  Copyright © 2017 Polina. All rights reserved.
//

import Foundation

struct WhichQuizeModel {
    
   
    
    var whichQM = ["Игра на роллы","Игра на сашими","Игра на устрицы с шампанским"]
    
    mutating func howManyQuestions(nameOfGame: String) -> Int {
        
        var summa: Int = 0
        if nameOfGame == whichQM[0] {
            summa = 3
        }
        
        if nameOfGame == whichQM[1] {
            summa = 5
        }
        if nameOfGame == whichQM[2] {
            summa = 7
        }
        return summa
    }
}
