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
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        lblTxt.text = "\(player.playerName) ты заработал  \(player.playerScore) забирай свои \(player.nameGame) и ...."
        // Do any additional setup after loading the view.
    }


    @IBAction func playAgainPressed(_ sender: Any) {
    }

}
