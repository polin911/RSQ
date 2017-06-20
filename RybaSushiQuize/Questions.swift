//
//  Questions.swift
//  RybaSushiQuize
//
//  Created by Polina on 14.06.17.
//  Copyright © 2017 Polina. All rights reserved.
//

import Foundation
import UIKit

struct Question {
    
    let title: String
    let answers: [String]
    
    private let imageName: String
    private let correctAnswer: String
    
    var image: UIImage? {
        return UIImage(named: imageName)
    }
    
    init?(json:[String: Any]) {
        guard let title = json["question"] as? String,
            let imageName     = json["image"] as? String,
            let correctAnswer = json["correctAnswer"] as? String,
            let answers       = json["answers"] as? [String],
        answers.contains(correctAnswer)
            else {
                return nil
        }
        self.title = title
        self.answers = answers
        self.correctAnswer = correctAnswer
        self.imageName = imageName
    }
    
    func answerIsCorrect(answer: String?) -> Bool {
        return correctAnswer == answer
    }
}
