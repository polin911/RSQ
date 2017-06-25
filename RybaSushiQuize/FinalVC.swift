//
//  FinalVC.swift
//  RybaSushiQuize
//
//  Created by Polina on 13.06.17.
//  Copyright © 2017 Polina. All rights reserved.
//

import UIKit

class FinalVC: UIViewController {

    @IBOutlet var img: UIImageView!
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
        
    }

    @IBAction func playWithFeliksPressed(_ sender: Any) {
        performSegue(withIdentifier: "PlayAgain", sender: self)
    }
    
    func updateScore() {
        score = player.playerScore
        if player.nameGame == player.wchiGame[0] {
            switch score {
            case 0:
              lblTxt.text = "ты растроил Семена"
                img.image = #imageLiteral(resourceName: "unSmile")
            case 1...2:
                lblTxt.text = "ты ответил на \(score) вопроса ,Семен добрый он тебя угостит кусочком авакадо "
                img.image = #imageLiteral(resourceName: "smile")
            case 3:
                lblTxt.text = "Ты молодец, ты заработал \(score) очков! Получай свой обед! "
                img.image = #imageLiteral(resourceName: "glass")
            default:
                lblTxt.text = "стоит переиграть"
            }
        }
        if player.nameGame == player.wchiGame[1] {
            switch score {
            case 0:
                lblTxt.text = "ты растроил Семена"
                img.image = #imageLiteral(resourceName: "unSmile")
            case 1...3:
                lblTxt.text = "ты заработал \(score) балла Семен добрый он тебя угостит кусочком авакадо "
                img.image = #imageLiteral(resourceName: "smile")
            case 5:
                lblTxt.text = "Ты молодец, ты заработал \(score) очков! Получай свой обед! "
                img.image = #imageLiteral(resourceName: "glass")
            default:
                lblTxt.text = "стоит переиграть"
            }
        }
        if player.nameGame == player.wchiGame[2] {
            switch score {
            case 0:
                lblTxt.text = "ты растроил Семена"
                img.image = #imageLiteral(resourceName: "unSmile")
            case 1...3:
                lblTxt.text = "ты заработал \(score)Семен добрый он тебя угостит тремя устрицами "
                img.image = #imageLiteral(resourceName: "smile")
            case 5...7:
                lblTxt.text = "Ты молодец, ты заработал \(score) очков! Рома тебе сейчас откроет 12 устриц "
                img.image = #imageLiteral(resourceName: "glass")
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
        if let vcPlayAgain = segue.destination as? WhichQuizeVC {
            vcPlayAgain.player.playerName = self.player.playerName
        }
    }

}
