//
//  WhichQuizeVC.swift
//  RybaSushiQuize
//
//  Created by Polina on 13.06.17.
//  Copyright © 2017 Polina. All rights reserved.
//

import UIKit
import Spring

class WhichQuizeVC: UIViewController{

    var player = Player()
    
    @IBOutlet var nameLblTxt: UILabel!
    
     var whichQuizeChoose = ["Игра на роллы", "Игра на суши", "Игра на устрицы с шампанским" ]
     var nameText = String()
     var whichQuize : WhichQuizeModel!
    
    @IBOutlet var btnR: SpringButton!
    @IBOutlet var btnS: SpringButton!
    @IBOutlet var btnU: SpringButton!
    
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
            self.player.totalQuestion = 3
            self.player.winnerScore   = 3
            self.player.looserScore   = 0
        }
        if sender == btnS {
            self.player.nameGame = "Игра на суши"
            self.player.totalQuestion = 5
            self.player.winnerScore   = 4
            self.player.looserScore   = 0
        }
        if sender == btnU {
            self.player.nameGame = "Игра на устрицы с шампанским"
            self.player.totalQuestion = 7
            self.player.winnerScore   = 6
            self.player.looserScore   = 0
        }
        performSegue(withIdentifier: "showInstructions", sender: self)
    }
    
    //MARK: UpdateView
    
    func updateWinnerView() {
        if player.nameGame == player.wchiGame[0] {
            btnR.alpha = 0.4
            
        }
        if player.nameGame == player.wchiGame[1] {
            btnS.alpha = 0.4

        }
        if player.nameGame == player.wchiGame[2] {
            btnU.alpha = 0.4

        }
        
    }
    //MARK: Spring Animation
    
    func sprAnimation() {
        btnR.animation = "squeezeLeft"
        btnR.duration  = 7
        btnR.animate()
        
        btnS.animation = "squeezeRight"
        btnS.duration  = 7
        btnS.animate()
        
        btnU.animation = "squeezeLeft"
        btnU.duration  = 7
        btnU.animate()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    
}
