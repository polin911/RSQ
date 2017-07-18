//
//  FinalVC.swift
//  RybaSushiQuize
//
//  Created by Polina on 13.06.17.
//  Copyright © 2017 Polina. All rights reserved.
//

import UIKit
import Spring

class FinalVC: UIViewController {

    @IBOutlet var img: SpringImageView!
    var player = Player()
    
    @IBOutlet var lblTxt: UILabel!
    var score = 0
    var textForScore = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        lblTxt.text = String(player.playerScore)

        updateScore()
        // Do any additional setup after loading the view.
    }

    @IBAction func playAgainPressed(_ sender: Any) {
        performSegue(withIdentifier: "welcomePage", sender: self)
    }

    @IBAction func playWithFeliksPressed(_ sender: Any) {
        performSegue(withIdentifier: "PlayFeniks", sender: self)
    }
    
    func updateScore() {
        score = player.playerScore
        if player.nameGame == player.wchiGame[0] {
            switch score {
            case 0:
              lblTxt.text = "держи авакадку и не в чем себе не отказывай"
                img.image = #imageLiteral(resourceName: "laobc-Avocado")
            case 1...2:
                lblTxt.text = "ты ответил на \(score) вопроса ,Семен добрый он тебя угостит кусочком авакадо "
                img.image = #imageLiteral(resourceName: "laobc-Avocado")
            case 3:
                lblTxt.text = "Ты молодец, ты заработал \(score) очков! Получай свой обед! "
                img.image = #imageLiteral(resourceName: "rolliVRyad")
            default:
                lblTxt.text = "стоит переиграть"
            }
        }
        if player.nameGame == player.wchiGame[1] {
            switch score {
            case 0:
                lblTxt.text = "ты растроил Семена"
                img.image = #imageLiteral(resourceName: "losserRyba")
            case 1...4:
                lblTxt.text = "ты заработал \(score) балла Семен добрый он тебя угостит кусочком авакадо "
                img.image = #imageLiteral(resourceName: "sushi2")
            case 3:
                lblTxt.text = "Ты молодец, ты заработал \(score) очков! Получай свой обед! "
                img.image = #imageLiteral(resourceName: "sushi2")
            default:
                lblTxt.text = "стоит переиграть"
            }
        }
        if player.nameGame == player.wchiGame[2] {
            switch score {
            case 0...6:
                lblTxt.text = "Я предупреждал ... с устрицами лучше не ошибаться"
                img.image = #imageLiteral(resourceName: "cat_3")
            
            case 7:
                lblTxt.text = "Ты молодец, ты заработал \(score) очков! Рома тебе сейчас откроет 12 устриц "
                img.image = #imageLiteral(resourceName: "ustriciNabor")
            default:
                lblTxt.text = "стоит переиграть"
            }
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
        if let vc = segue.destination as? FeliksGameVC {
             self.player.playerScore = 0
        vc.player = self.player
        }
      
    }
    
    //MARK : SprAnimation
    func sprAnimation() {
        img.animation = "pop"
        img.duration = 5
        img.animate()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        sprAnimation()
    }

}
