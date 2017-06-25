//
//  WhichQuizeVC.swift
//  RybaSushiQuize
//
//  Created by Polina on 13.06.17.
//  Copyright © 2017 Polina. All rights reserved.
//

import UIKit

class WhichQuizeVC: UIViewController{

    var player = Player()
    
    @IBOutlet var nameLblTxt: UILabel!
    @IBOutlet var tableView: UITableView!
    
     var whichQuizeChoose = ["Игра на роллы", "Игра на сашими", "Игра на устрицы с шампанским" ]
     var nameText = String()
     var whichQuize : WhichQuizeModel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
        nameLblTxt.text = "Привет \(player.playerName) ты готов перекусить ??"
       
        checking()
       
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let instructVC = segue.destination as? InstructionVC
       
        instructVC?.player = self.player
        //whichQuize.howManyQuestions(nameOfGame: typeOf)
}
    
    func checking() {
        print("WhichQuize@@@@@@@@@@@@@@@@@@@@@whichGame:\(player.wchiGame) @@@@@@@@@@@@@@name:\(player.playerName)@@@@@@@@@@@@@@@@@@@@\(player.playerScore) @@@@@@@@@@@@@name of Game: \(player.nameGame)")
    }
}
//MARK: TableView

extension WhichQuizeVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let nameQuize = player.wchiGame[indexPath.row]
        self.player.nameGame = nameQuize
        performSegue(withIdentifier: "showInstructions", sender: nameQuize)
       
      
    }
    
}


extension WhichQuizeVC: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return player.wchiGame.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "whichQuize") as! WhichQuizeCell
        cell.quizeLabel.text = player.wchiGame[indexPath.row]
        
        return cell
    }
}



