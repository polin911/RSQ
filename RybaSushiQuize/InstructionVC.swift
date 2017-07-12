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

    
    var player = Player()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        
    }
    
    //MARK: UpdateView
    
    func updateUI() {
        
        typeLbl.text = player.nameGame
        if player.nameGame == player.wchiGame[0] {
            instructionTextLabel.text = "Любишь роллы \(TEXTINSTRUCT)"
        }
        if player.nameGame == player.wchiGame[1] {
            instructionTextLabel.text = "Любишь сушими\(TEXTINSTRUCT)"
        }
        if player.nameGame == player.wchiGame[2] {
            instructionTextLabel.text = "Любишь устрицы с шампанским \(TEXTINSTRUCT)"
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? QuizeVC {
            vc.player = self.player }
        if let vc2 = segue.destination as? QuizeCollectionVC {
            vc2.player = self.player
        }
            }
    
    
    

    
    @IBAction func playBtnPressed(_ sender: Any) {
        
        performSegue(withIdentifier: "showQuize", sender: self)
    }
    
    
}
