//
//  FelicsVC.swift
//  RybaSushiQuize
//
//  Created by Polina on 21.06.17.
//  Copyright © 2017 Polina. All rights reserved.
//

import UIKit

class FelicsVC: UIViewController {

    
    var player = Player()
    @IBOutlet var lblTxt: UILabel!
    var score = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateScore()
        // Do any additional setup after loading the view.
    }


    @IBAction func playAgainPressed(_ sender: Any) {
        performSegue(withIdentifier: "playAgainFromFeliks", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! WhichQuizeVC
        vc.player.playerName = self.player.playerName
    }
    
    func updateScore() {
        score = player.playerScore
        switch score {
        case 0:
            lblTxt.text = "Феликс подумал что ты тупой"
        case 1...3:
            lblTxt.text = "ты угадал всего \(score) Феликс разачарован"
        case 3...7:
            lblTxt.text = "\(score)Феликс гордиться тобой"
        default:
            lblTxt.text = "ты бот ??"
        }
    }

}
