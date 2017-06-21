//
//  FeliksGameVC.swift
//  RybaSushiQuize
//
//  Created by Polina on 21.06.17.
//  Copyright © 2017 Polina. All rights reserved.
//

import UIKit

class FeliksGameVC: UIViewController {

    var player = Player()
    @IBOutlet var questionLbl: UILabel!
    @IBOutlet var collectionV: UICollectionView!
    @IBOutlet var imageQuize: UIImageView!
    
    //*
    var isOnScreen: Bool {
        return isViewLoaded && view.window != nil
    }
    var currentQuestionIndex = 0
    var score = 0
    
    var currentQuestion: Question? {
        didSet {
            updateView()
        }
    }
    var questionList : [Question]? {
        didSet {
            let random = questionList?[Int(arc4random_uniform(UInt32((questionList?.count)!)))]
            currentQuestionIndex = 0
            score = 0
            currentQuestion = random
        }
    }
    //*
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadData()
      
    }
    
    //MARK: Setup
    
    func loadData() {
        collectionV.delegate = self
        collectionV.dataSource =  self
        
        let loader = DataLoader()
        let result = loader.loadData(fileName: "Felics")
        
        self.title = result.quizeName
        self.questionList = result.questions
    }
    
    private func updateView() {
        let sectionToReload = IndexSet(integer: 0)
        
        self.collectionV.reloadSections(sectionToReload)
        let duration = isOnScreen ? 0.2 : 0
        UIView.animate(withDuration: duration, animations: {
            self.questionLbl.alpha = 0
            self.imageQuize.alpha = 0
        }) { (finished) in
            self.questionLbl.text = self.currentQuestion?.title
            self.imageQuize.image = self.currentQuestion?.image
            
            UIView.animate(withDuration: duration, animations: {
                self.questionLbl.alpha = 1
                self.imageQuize.alpha = 1
            }, completion: nil)
        }
    }

    

}
extension FeliksGameVC: UICollectionViewDelegate {
    
}

extension FeliksGameVC: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.currentQuestion?.answers.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionV.dequeueReusableCell(withReuseIdentifier: "FelicsCell", for: indexPath) as! FelicsQuizeCollectionCell
        cell.answersLbl.text = currentQuestion?.answers[indexPath.row]
        return cell
    }
}







