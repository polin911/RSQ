//
//  WhichQuizeVC.swift
//  RybaSushiQuize
//
//  Created by Polina on 13.06.17.
//  Copyright © 2017 Polina. All rights reserved.
//

import UIKit

class WhichQuizeVC: UIViewController{

    
    @IBOutlet var nameLblTxt: UILabel!
    
    var nameText = String()
    
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLblTxt.text = "Привет \(nameText) ты готов перекусить ??"
       
        
       
    }

    


}
