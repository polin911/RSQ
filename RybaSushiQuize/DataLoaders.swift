//
//  DataLoaders.swift
//  RybaSushiQuize
//
//  Created by Polina on 14.06.17.
//  Copyright © 2017 Polina. All rights reserved.
//

import Foundation

class DataLoader {
    
    func loadData(fileName: String) ->  (quizeName: String, questions:[Question]) {
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
        
        var questions = [Question]()
        for json in jsonToConvert {
            if let aQuestion = Question(json: json) {
                questions.append( aQuestion)
            }
        }
        
        if questions.count == 0 {
            fatalError("we dont have any question")
        }
        return(quizeName, questions)
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
