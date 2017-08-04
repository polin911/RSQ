//
//  FeliksInstructions.swift
//  RybaSushiQuize
//
//  Created by Polina on 05.07.17.
//  Copyright © 2017 Polina. All rights reserved.
//

import UIKit

class FeliksInstructions: UIViewController {

    var player = Player()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as? FeliksGameVC
        vc?.player = self.player
    }


}
