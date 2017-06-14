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
    @IBOutlet var tableView: UITableView!
    
     var whichQuizeChoose = ["Игра на роллы", "Игра на сашими", "Игра на устрицы с шампанским" ]
     var nameText = String()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        nameLblTxt.text = "Привет \(nameText) ты готов перекусить ??"
       
        
       
    }


}

//MARK: TableView

extension WhichQuizeVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let whichQuize = whichQuizeChoose[indexPath.row]
        
        performSegue(withIdentifier: "showInstructions", sender: whichQuize)
    }
    
}


extension WhichQuizeVC: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return whichQuizeChoose.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "whichQuize") as! WhichQuizeCell
        cell.quizeLabel.text = whichQuizeChoose[indexPath.row]
        
        return cell
    }
}



