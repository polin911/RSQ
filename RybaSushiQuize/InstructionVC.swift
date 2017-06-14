//
//  InstructionVC.swift
//  RybaSushiQuize
//
//  Created by Polina on 14.06.17.
//  Copyright © 2017 Polina. All rights reserved.
//

var TEXTINSTRUCT = " я смотрю ты не очень голоден....бла бла блабла бла блабла бла блабла бла блабла бла блабла бла блабла бла блабла бла блабла бла блабла бла блабла бла блабла бла блабла бла блабла бла бла бла блабла бла блабла бла блабла бла блаблабла бла блабла бла бла"

import UIKit

class InstructionVC: UIViewController {

    @IBOutlet var instructionTextLabel: UILabel!
    
    @IBOutlet var typeLbl: UILabel!
    
    var nameUser: String!
    var typeOfGame = ["Игра на роллы", "Игра на сашими", "Игра на устрицы с шампанским" ]
    
    
    
    //MARK: Enum
    enum TypeInst {
        case typeRolli
        case typeSashimi
        case typeUstrici
    }

    var chooseType = TypeInst.typeRolli
    
    func updateView() {
        
        switch chooseType {
        case .typeRolli:
            instructionTextLabel.text = "любишь Роллы \(TEXTINSTRUCT) "
        case .typeSashimi:
            instructionTextLabel.text = "любишь Сашими \(TEXTINSTRUCT) "
        case .typeUstrici:
            instructionTextLabel.text = "мммм Устрицы с шампанским \(TEXTINSTRUCT) "
        
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateView()
        

    }


    @IBAction func continueBTNPressed(_ sender: Any) {
    }
    

}
