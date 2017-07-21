//
//  WinnerVC.swift
//  RybaSushiQuize
//
//  Created by Polina on 04.07.17.
//  Copyright © 2017 Polina. All rights reserved.
//

import UIKit
import Spring

class WinnerVC: UIViewController {

    var player = Player()
    @IBOutlet var txtLbl: UILabel!
    @IBOutlet var sprImage: SpringImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checking()

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? FeliksInstructions {
        self.player.playerScore = 0
            vc.player = self.player
        }
        if let whichVC = segue.destination as? WhichQuizeVC {
           
            self.player.playerScore = 0
            whichVC.player = self.player
        
        }
    }
    
    //MARK: updateUI
    func updateLblTxt() {
        if player.wchiGame[0] == player.nameGame {
            txtLbl.text = "\(player.playerName) поздравляю!!! Ты практически гений!!!На все вопросы у тебя есть ответ!!!"
            sprImage.image = #imageLiteral(resourceName: "Sushi_Tray_icon")
        }
        else if player.wchiGame[1] == player.nameGame {
            txtLbl.text = "\(player.playerName) ура поздравляю!!! Вот твои Суши!"
            sprImage.image = #imageLiteral(resourceName: "sushi")
        }
        else if player.wchiGame[2] == player.nameGame {
            txtLbl.text = "\(player.playerName) ура поздравляю!!! Вот твои Устрицы!"
            sprImage.image = #imageLiteral(resourceName: "ustriciNabor")
        }
    }

    func showSprAnimation() {
                sprImage.animation = "swing"
                sprImage.duration = 10
                sprImage.repeatCount = Float.infinity
                sprImage.animate()
    }

    override func viewDidAppear(_ animated: Bool) {
        showSprAnimation()
        updateLblTxt()
    }
    
    
    @IBAction func pressPlayAgain(_ sender: Any) {
        self.player.winGame = self.player.nameGame
    }
    
    func checking() {
        print("WhichQuize@@@@@@@@@@@@@@@@@@@@@whichGame:\(player.wchiGame) @@@@@@@@@@@@@@name:\(player.playerName)@@@@@@@@@@@@@@@@@@@@\(player.playerScore) @@@@@@@@@@@@@name of Game: \(player.nameGame) ######### winnnersGame: \(player.winGame)")
    }

}
