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

       // showAnimation()

   
    }


    func showAnimation() {

            sprRolliVRyad.animation = "slideLeft"
            sprRolliVRyad.duration = 6
            sprRolliVRyad.animate()
        
        sprRolliVRyad.animateNext {
            self.sprRolliVRyad.animation = "slideLeft"
            self.sprRolliVRyad.duration = 6
            self.sprRolliVRyad.animate()
        }
        sprRolliVRyad.animateNext {
            self.sprRolliVRyad.animation = "slideLeft"
            self.sprRolliVRyad.duration = 6
            self.sprRolliVRyad.animate()
        }
        
        
        sprWelcomeSushi.animation = "zoomIn"
        sprWelcomeSushi.duration = 10
        sprWelcomeSushi.animate()

        }
    

    
    override func viewDidAppear(_ animated: Bool) {
        
        showAnimation()
    }

}
