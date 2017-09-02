//
//  DataLoaderEmoji.swift
//  RybaSushiQuize
//
//  Created by Polina on 30.08.17.
//  Copyright © 2017 Polina. All rights reserved.
//

import Foundation
class DataLoaderEmoji {
    
    func loadData(fileName: String) ->  (quizeName: String, questions:[Emoji]) {
        let pathToFile = Bundle.main.path(forResource: fileName, ofType: "json")!
        print(pathToFile)
        
        let data = try! Data(contentsOf: URL(fileURLWithPath: pathToFile))
        let json = try! JSONSerialization.jsonObject(with: data, options: [])
        
        guard let questionJson = json as? [String: Any] else {
            fatalError("no correct with question: \(json)")
        }
        guard let quizeName = questionJson["name"] as? String,
            let jsonToConvert = questionJson["questions"] as? [[String:Any]] else {
                fatalError("no correcet victorina")
        }
        
        var questions = [Emoji]()
        for json in jsonToConvert {
            if let aQuestion = Emoji(json: json) {
                questions.append( aQuestion)
            }
        }
        
        if questions.count == 0 {
            fatalError("we dont have any question")
        }
        return(quizeName, questions)
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
