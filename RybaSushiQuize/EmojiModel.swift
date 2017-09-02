//
//  EmojiModel.swift
//  RybaSushiQuize
//
//  Created by Polina on 30.08.17.
//  Copyright © 2017 Polina. All rights reserved.
//

import Foundation
import UIKit

struct Emoji {
    
    var countOfWords: Int {
      return  correctWord.characters.count
    }
    var correctWord: String
    
    private var kindOfGame: String
    var whichGame: UIImage? {
        return UIImage(named: kindOfGame)
    }
    
    private var imageEmoji: String
    var imageE: UIImage? {
        return UIImage(named: imageEmoji)
    }
    
    var emojiArray: [String] {
        return correctWord.characters.map({String($0)})
    }
    
    init?(json:[String:Any]){
        guard let correctWord = json["correctWord"] as? String,
              let kindOfG     = json["kindOfGame"] as? String,
              let images      = json["image"] as? String
             // let countOfW    = Int
            else {
                return nil
        }
        self.correctWord = correctWord
        self.imageEmoji  = images
        self.kindOfGame  = kindOfG
        
    }
    
}
