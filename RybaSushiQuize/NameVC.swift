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
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        


    }

    @IBAction func startBtnPusshed(_ sender: UIButton) {
        
       guard namePlayer.text != "",
        namePlayer.text != nil else {
            return //можно вставить атеншион
        }
       
               performSegue(withIdentifier: "whichQuize", sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let whichQuizeVC = segue.destination as! WhichQuizeVC
        whichQuizeVC.nameText = namePlayer.text!
        
      
    }
    

}
