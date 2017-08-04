//
//  QuizeVC.swift
//  RybaSushiQuize
//
//  Created by Polina on 13.06.17.
//  Copyright © 2017 Polina. All rights reserved.
//

import UIKit

class QuizeVC: UIViewController {

    var player = Player()
    
    @IBOutlet var imageQuize: UIImageView!
    @IBOutlet var questionQuize: UILabel!
    @IBOutlet var tableView: UITableView!
    
    //*
    var isOnSreen: Bool {
        return isViewLoaded && view.window != nil
    }
    
    var quizeFileName = ["rolli","sashimi","ustrici"]
    var currentQuestionIndex = 0
    var score = 0
    
    var currentQuestion: Question? {
        didSet {
            updateViews()
        }
    }
    
    var questionList : [Question]? {
        didSet {
            currentQuestionIndex = 0
            score = 0
            currentQuestion = questionList?.first
            
        }
    }
    
    
    var question = [Question]()
    var countOfQuestions = 0
    
    
   
    
    
    //MARK: Enum
    enum TypeOfQuize {
        case rolli
        case sashimi
        case ustrici
    }
    
    var typeQuize = TypeOfQuize.ustrici
    
    func switchType() {
        switch typeQuize {
        case .rolli:
            countOfQuestions = 3
            
            questionQuize.text = "rolli"
            
        case .sashimi:
            countOfQuestions = 5
            
            questionQuize.text = "sashimi"
            
        case .ustrici:
            countOfQuestions = 7
            
            questionQuize.text = "ustrici"

        }
    }
    /////////////////////////////////////////
    
    
    func checking() {
        print("@@@@@@@@@@@@@@@@@@@@@whichGame:\(player.wchiGame) @@@@@@@@@@@@@@name:\(player.playerName)@@@@@@@@@@@@@@@@@@@@\(player.playerScore) @@@@@@@@@@@@@name of Game: \(player.nameGame)")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        checking()
        tableView.delegate = self
        tableView.dataSource = self
        
        loadData()
        
        // Do any additional setup after loading the view.
    }

//* 
    //MARK: Setup
    private func updateViews() {
        let sectionToReload = IndexSet(integer: 0)
        
        self.tableView.reloadSections(sectionToReload, with: isOnSreen ? .left: .none)
        let duration = isOnSreen ? 0.2 : 0
        UIView.animate(withDuration: duration, animations: {
            self.questionQuize.alpha = 0
            self.imageQuize.alpha    = 0
        },
        completion: { finished in
            self.questionQuize.text = self.currentQuestion?.title
            self.imageQuize.image   = self.currentQuestion?.image
            
            UIView.animate(withDuration: duration, animations: { 
                self.questionQuize.alpha = 1
                self.imageQuize.alpha    = 1
            },
                           completion: nil)
            })
    }

    func loadData() {
        let loader = DataLoader()
        let result = loader.loadData(fileName: "tryQuize")//(fileName: quizeName[0]для разных типов игры)
        print(result)
        
        self.title = result.quizeName
        self.questionList = result.questions
    }

}

extension QuizeVC: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "answersCell", for: indexPath)
        cell.textLabel?.text = currentQuestion?.answers[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.currentQuestion?.answers.count ?? 0
    }
}


extension QuizeVC: UITableViewDelegate {
    
}





