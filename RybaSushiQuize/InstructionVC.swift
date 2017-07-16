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
            instructionTextLabel.text = "Роллы у нас на любой вкус! От редких до самых элементарных, твой выбор зависит от твоего IQ, вкусно будет в любом случае. Итак: всего 50 вопросов, отвечая на 10 получишь аппетитный утешительный приз, от 30 верных - блюдо будет более изысканным! А если ответишь на все 50 - то твой  "
        }
        if player.nameGame == player.wchiGame[1] {
            instructionTextLabel.text = "А суши у нас самые вкусные в Москве. Ты поразишься разнообразию ассортимента: хамачи, гребешок, тунец, лосось, альбокор, гребенчатая креветка и т.д.. Итак: всего 70 вопросов, отвечая на 25 получишь аппетитный утешительный приз, от 55 верных, блюдо будет более изысканным! А если ответишь на все 70 - то твой  "
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
    
    
}
