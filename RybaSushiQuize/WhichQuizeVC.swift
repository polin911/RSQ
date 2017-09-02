//
//  WhichQuizeVC.swift
//  RybaSushiQuize
//
//  Created by Polina on 13.06.17.
//  Copyright © 2017 Polina. All rights reserved.
//

import UIKit
import Spring
import SCLAlertView

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
        
        if let instructVC = segue.destination as? InstructionVC {
        instructVC.player = self.player
        }
        if let feliksInstruct = segue.destination as? FeliksInstructions {
            feliksInstruct.player = self.player
        }
        
}
    
    func checking() {
        print("WhichQuize@@@@@@@@@@@@@@@@@@@@@whichGame:\(player.wchiGame) @@@@@@@@@@@@@@name:\(player.playerName)@@@@@@@@@@@@@@@@@@@@\(player.playerScore) @@@@@@@@@@@@@name of Game: \(player.nameGame) ######### winnnersGame: \(player.winGame)")
    }

    
    @IBAction func btnPressed(_ sender: UIButton) {
        if sender == btnR {
            //MARK: AlertIcon
            let alert = SCLAlertView()
            let alertViewIcon = #imageLiteral(resourceName: "odiRoll")
            _ = alert.addButton("Продолжить", target: self, selector: #selector(WhichQuizeVC.perSeg))
            _ = alert.showSuccess("Правила", subTitle: "У тебя есть три жизни(3 ролла) и 15 общих вопросов", closeButtonTitle: "Вернуться", colorStyle: 0xD33333, colorTextButton: 0xFFFFFF, circleIconImage:alertViewIcon, animationStyle: .topToBottom)
        
            //*изменить !
            self.player.nameGame = "Игра на роллы"
            self.player.totalQuestion = 18
            self.player.winnerScore   = 15
            self.player.looserScore   = 0
            
            self.player.scoreLife = 4
        }
        if sender == btnS {
            
            let alert = SCLAlertView()
            let alertViewIcon = #imageLiteral(resourceName: "odiRoll")
            _ = alert.addButton("Продолжить", target: self, selector: #selector(WhichQuizeVC.perSegFeliksGame))
            _ = alert.showSuccess("Правила", subTitle: "У тебя есть 55 секунд , отгадай 10 фильмов", closeButtonTitle: "Вернуться", colorStyle: 0xD33333, colorTextButton: 0xFFFFFF, circleIconImage:alertViewIcon, animationStyle: .topToBottom)
            
            
            self.player.nameGame = "Игра на суши"
//            self.player.totalQuestion = 38
            self.player.winnerScore     = 10
//            self.player.looserScore   = 0
//            
//            self.player.scoreLife = 3
        }
        if sender == btnU {
            
            let alert = SCLAlertView()
            let alertViewIcon = #imageLiteral(resourceName: "odiRoll")
            _ = alert.addButton("Продолжить", target: self, selector: #selector(WhichQuizeVC.perSeg))
            _ = alert.showSuccess("Правила", subTitle: "Угадай песню по Emoji", closeButtonTitle: "Вернуться", colorStyle: 0xD33333, colorTextButton: 0xFFFFFF, circleIconImage:alertViewIcon, animationStyle: .topToBottom)
            
            self.player.nameGame = "Игра на устрицы с шампанским"
            self.player.totalQuestion = 71
            self.player.winnerScore   = 70
            self.player.looserScore   = 0
            
            self.player.scoreLife = 2
        }
        //performSegue(withIdentifier: "showInstructions", sender: self)
    }
    
    //MARK: performSEgue
    func perSeg() {
        performSegue(withIdentifier: "showInstructions", sender: self)
    }
    func perSegFeliksGame() {
        performSegue(withIdentifier: "feliksGame", sender: self)
    }
    func perSegEmojiGame() {
        performSegue(withIdentifier: "emojiGame", sender: self)
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
