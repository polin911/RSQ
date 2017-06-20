//
//  QuizeCollectionVC.swift
//  RybaSushiQuize
//
//  Created by Polina on 20.06.17.
//  Copyright © 2017 Polina. All rights reserved.
//

import UIKit

class QuizeCollectionVC: UIViewController {

    var player = Player()
    
    @IBOutlet var questionLbl: UILabel!
    @IBOutlet var questionImg: UIImageView!
    
    @IBOutlet var collectionV: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        checking()
        // Do any additional setup after loading the view.
    }

    func checking() {
        print("@@@@@@@@@@@@@@@@@@@@@whichGame:\(player.wchiGame) @@@@@@@@@@@@@@name:\(player.playerName)@@@@@@@@@@@@@@@@@@@@\(player.playerScore) @@@@@@@@@@@@@name of Game: \(player.nameGame) with love")
    }

}
