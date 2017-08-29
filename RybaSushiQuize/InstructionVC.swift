//
//  InstructionVC.swift
//  RybaSushiQuize
//
//  Created by Polina on 14.06.17.
//  Copyright © 2017 Polina. All rights reserved.
//


import UIKit
import Spring

class InstructionVC: UIViewController {
    
    
    @IBOutlet var instaGroupSprImage: SpringImageView!
    
    @IBOutlet var instructionTextLabel: UILabel!
    @IBOutlet var typeLbl: UILabel!

    
    var player = Player()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
        checking()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
         instaAni()
    }
    //MARK: UpdateView
    
    func updateUI() {
        
       
        
        let addToMyMutatbleStr: [String: AnyObject]? = [NSFontAttributeName: UIFont(name: "Bradley Hand", size:18)!, NSForegroundColorAttributeName: UIColor.white]
        let instractTxt1 = "Роллы у нас на любой вкус! От редких до самых элементарных, твой выбор зависит от твоего IQ . Вкусно будет в любом случае."
        let itogTxt1 = " Итак: всего 25 вопросов, отвечая на 5 - уровень твоего IQ соответствует уровню взрослого примата обезьяны, от 20 верных - Я поверю, что ты закончил среднюю школу! А если ответишь на все 25 - смело можешь претендовать на звание интеллектуала,не забывай этот уровень самый легкий! Удачи!"
        
        let myMutableString1 = NSMutableAttributedString(string: instractTxt1, attributes: [NSFontAttributeName: UIFont(name: "Bradley Hand", size:18)!, NSForegroundColorAttributeName: UIColor.white])
        
        
        let itog1 = NSMutableAttributedString(string: itogTxt1, attributes: addToMyMutatbleStr)
        myMutableString1.append(itog1)
        
        typeLbl.text = player.nameGame
        if player.nameGame == player.wchiGame[0] {
            instructionTextLabel.attributedText = myMutableString1
        }
        
        if player.nameGame == player.wchiGame[1] {
            instructionTextLabel.text = "А суши у нас самые вкусные в Москве. Ты поразишься разнообразию ассортимента: хамачи, гребешок, тунец, лосось, альбокор, гребенчатая креветка и т.д.. Итак: всего 70 вопросов, отвечая на 25 уровень твоего IQ соответствует уровню взрослого примата обезьяны, от 55 верных - Я поверю, что ты закончил среднюю школу! А если ответишь на все 70 - смело можешь претендовать на звание интелектуала!"
        }
        if player.nameGame == player.wchiGame[2] {
            instructionTextLabel.text = "И... Высший пилотаж! - дюжина свежайших устриц Кумамото. Игра без права на ошибку! С устрицами не шутят 100 вопросов - 100 ответов устрицы твои! + Шампанское от Феликса (если повезет и он на месте) Удачи!"
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
    
    func checking() {
        print("WhichQuize@@@@@@@@@@@@@@@@@@@@@whichGame:\(player.wchiGame) @@@@@@@@@@@@@@name:\(player.playerName)@@@@@@@@@@@@@@@@@@@@\(player.playerScore) @@@@@@@@@@@@@name of Game: \(player.nameGame) ######### winnnersGame: \(player.winGame)")
    }
    
    func instaAni() {
        instaGroupSprImage.animation = "slideDown"
        instaGroupSprImage.duration = 5
        instaGroupSprImage.animateNext {
            self.instaGroupSprImage.animation = "fadeOut"
            self.instaGroupSprImage.duration = 3
            self.instaGroupSprImage.animate()
        }
        instaGroupSprImage.animate()
    }
    
}
