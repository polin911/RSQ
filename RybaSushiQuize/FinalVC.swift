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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblTxt.text = String(player.playerScore)

        // Do any additional setup after loading the view.
    }

    @IBAction func playAgainPressed(_ sender: Any) {
    }

    @IBAction func playWithFeliksPressed(_ sender: Any) {
    }


}
