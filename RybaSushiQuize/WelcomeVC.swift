//
//  WelcomeVC.swift
//  RybaSushiQuize
//
//  Created by Polina on 30.06.17.
//  Copyright © 2017 Polina. All rights reserved.
//

import UIKit
import Spring

class WelcomeVC: UIViewController {

    @IBOutlet var backGround: SpringImageView!
    
    
    @IBOutlet var sprRolliVRyad: SpringImageView!
    
    @IBOutlet var sprWelcomeSushi: SpringImageView!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        showAnimation()

        // Do any additional setup after loading the view.
    }


    func showAnimation() {
       
//        ustriciNabor2.animation = "swing"
//        ustriciNabor2.duration = 10
//        ustriciNabor2.animate()

        
            sprRolliVRyad.animation = "slideLeft"
            sprRolliVRyad.duration = 10
            sprRolliVRyad.animate()
        
        sprWelcomeSushi.animation = "zoomIn"
        sprWelcomeSushi.duration = 10
        sprWelcomeSushi.animate()

        }
    

    
    override func viewDidAppear(_ animated: Bool) {
        
    }

}
