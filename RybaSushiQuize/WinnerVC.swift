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
        
        
    
       
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as? FeliksGameVC
        self.player.playerScore = 0
        vc?.player = self.player
    }
    
    func updateLblTxt() {
        if player.wchiGame[0] == player.nameGame {
            txtLbl.text = "\(player.playerName) ура поздравляю!!! Вот твои Роллы!"
            sprImage.image = #imageLiteral(resourceName: "Sushi_Tray_icon")
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
    }

}
