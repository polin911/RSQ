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

    func showSprAnimation() {
                sprImage.animation = "swing"
                sprImage.duration = 10
                sprImage.repeatCount = Float.infinity
                sprImage.animate()
    }

    override func viewDidAppear(_ animated: Bool) {
        showSprAnimation()
    }

}
