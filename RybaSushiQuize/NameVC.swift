//
//  NameVC.swift
//  RybaSushiQuize
//
//  Created by Polina on 13.06.17.
//  Copyright © 2017 Polina. All rights reserved.
//

import UIKit

//MARK: protocols




class NameVC: UIViewController, UITextFieldDelegate  {

    @IBOutlet var startBtn: UIButton!
    
    @IBOutlet var namePlayer: UITextField!
    
    var player = Player()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        namePlayer.enablesReturnKeyAutomatically = true
        namePlayer.delegate = self


    }
    
    //textField
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        namePlayer.resignFirstResponder()
        startBtn.isHidden = false
        return(true)
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
