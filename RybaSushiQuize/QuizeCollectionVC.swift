//
//  QuizeCollectionVC.swift
//  RybaSushiQuize
//
//  Created by Polina on 20.06.17.
//  Copyright © 2017 Polina. All rights reserved.
//

import UIKit

class QuizeCollectionVC: UIViewController {
    
    var player = Player()
    var question = [Question]()
    
    @IBOutlet var questionLbl: UILabel!
    @IBOutlet var questionImg: UIImageView!
    @IBOutlet var collectionV: UICollectionView!
    
    //*
    
    var isOnScreen: Bool {
        return isViewLoaded && view.window != nil
    }
    var currentQuestionIndex = 0
    var score = 0
    var currentQuestion : Question? {
        didSet {
            updateView()
        }
    }
    
    var questionList : [Question]? {
        didSet {
            currentQuestionIndex = 0
            score = 0
            currentQuestion = questionList?.first
        }
    }
    //*
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadData()
        
        checking()
        // Do any additional setup after loading the view.
    }
    
    func loadData() {
        collectionV.delegate = self
        collectionV.dataSource =  self
        
        let loader = DataLoader()
        let result = loader.loadData()
        
        self.title = result.quizeName
        self.questionList = result.questions
    }
    
    private func updateView() {
        let sectionToReload = IndexSet(integer: 0)
        
        self.collectionV.reloadSections(sectionToReload)
        let duration = isOnScreen ? 0.2 : 0
        UIView.animate(withDuration: duration, animations: {
            self.questionLbl.alpha = 0
            self.questionImg.alpha = 0
        }) { (finished) in
            self.questionLbl.text = self.currentQuestion?.title
            self.questionImg.image = self.currentQuestion?.image
            
            UIView.animate(withDuration: duration, animations: {
                self.questionLbl.alpha = 1
                self.questionImg.alpha = 1
            }, completion: nil)
        }
    }
    
    func checking() {
        print("@@@@@@@@@@@@@@@@@@@@@whichGame:\(player.wchiGame) @@@@@@@@@@@@@@name:\(player.playerName)@@@@@@@@@@@@@@@@@@@@\(player.playerScore) @@@@@@@@@@@@@name of Game: \(player.nameGame) with love")
    }
    
}

extension QuizeCollectionVC : UICollectionViewDelegate {
    
}
extension QuizeCollectionVC: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.currentQuestion?.answers.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionV.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath) as! WhichQuizeCollectionCell
        cell.answersLbl.text = currentQuestion?.answers[indexPath.row]
        
        return cell
    }
    
}
