//
//  NameVC.swift
//  RybaSushiQuize
//
//  Created by Polina on 13.06.17.
//  Copyright © 2017 Polina. All rights reserved.
//

import UIKit

//MARK: protocols




class NameVC: UIViewController  {

    
    @IBOutlet var namePlayer: UITextField!
    
    var player = Player()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        


    }

    @IBAction func startBtnPusshed(_ sender: Any) {
        if namePlayer.text != nil {
        self.player.playerName = namePlayer.text ?? ""
            performSegue(withIdentifier: "goToWhich", sender: self)
        }
        return
       
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as? WhichQuizeVC
        vc?.player = self.player
    }
    

}
