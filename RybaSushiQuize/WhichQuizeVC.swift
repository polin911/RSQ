//
//  WhichQuizeVC.swift
//  RybaSushiQuize
//
//  Created by Polina on 13.06.17.
//  Copyright © 2017 Polina. All rights reserved.
//

import UIKit

class WhichQuizeVC: UIViewController{

    var player = Player()
    
    @IBOutlet var nameLblTxt: UILabel!

    
     var whichQuizeChoose = ["Игра на роллы", "Игра на сашими", "Игра на устрицы с шампанским" ]
     var nameText = String()
     var whichQuize : WhichQuizeModel!
    
    @IBOutlet var btnR: UIButton!
    @IBOutlet var btnS: UIButton!
    @IBOutlet var btnU: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameLblTxt.text = "Привет \(player.playerName) ты готов перекусить ??"
       
        updateWinnerView()
        checking()
       
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let instructVC = segue.destination as? InstructionVC
       
        instructVC?.player = self.player
}
    
    func checking() {
        print("WhichQuize@@@@@@@@@@@@@@@@@@@@@whichGame:\(player.wchiGame) @@@@@@@@@@@@@@name:\(player.playerName)@@@@@@@@@@@@@@@@@@@@\(player.playerScore) @@@@@@@@@@@@@name of Game: \(player.nameGame) ######### winnnersGame: \(player.winGame)")
    }

    
    @IBAction func btnPressed(_ sender: UIButton) {
        if sender == btnR {
            self.player.nameGame = "Игра на роллы"
        }
        if sender == btnS {
            self.player.nameGame = "Игра на сашими"
        }
        if sender == btnU {
            self.player.nameGame = "Игра на устрицы с шампанским"
        }
        performSegue(withIdentifier: "showInstructions", sender: self)
    }
    
    //MARK: UpdateView
    
    func updateWinnerView() {
        if player.nameGame == player.wchiGame[0] {
            btnR.alpha = 0.4
        }
        if player.nameGame == player.wchiGame[1] {
            btnR.alpha = 0.4
        }
        if player.nameGame == player.wchiGame[2] {
            btnR.alpha = 0.4
        }
        
    }
    
    
}
