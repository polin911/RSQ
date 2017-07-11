//
//  QuizeCollectionVC.swift
//  RybaSushiQuize
//
//  Created by Polina on 20.06.17.
//  Copyright © 2017 Polina. All rights reserved.
//

import UIKit

class QuizeCollectionVC: UIViewController {
    
    var quizeCell = WhichQuizeCollectionCell()
    
    var player = Player()
    //var question = [Question]()
    
    
    @IBOutlet var scoreLbl: UILabel!
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
            let random = questionList?[Int(arc4random_uniform(UInt32((questionList?.count)!)))]
            currentQuestionIndex = 0
            score = 0
            currentQuestion = random
        }
    }
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startTimer()
        loadData()
        checking()
       
 
    }
    
    func loadData() {
        collectionV.delegate = self
        collectionV.dataSource =  self
        
        let loader = DataLoader()
        let result = loader.loadData(fileName: "tryQuize")
        
        self.title = result.quizeName
        self.questionList = result.questions
    }
    
    private func updateView() {
        
        //timer:
        
        timerOn = true
        seconds = 20
        
        let sectionToReload = IndexSet(integer: 0)
        self.scoreLbl.text = "\(score)"
        self.collectionV.reloadSections(sectionToReload)

        let duration = isOnScreen ? 0.2 : 0
        UIView.animate(withDuration: duration, animations: {
            self.questionLbl.alpha = 0
           // self.questionImg.alpha = 0
        }) { (finished) in
            self.questionLbl.text = self.currentQuestion?.title
            //self.questionImg.image = self.currentQuestion?.image
            
            UIView.animate(withDuration: duration, animations: {
                self.questionLbl.alpha = 1
                //self.questionImg.alpha = 1
            }, completion: nil)
        }
    }
    //MARK: Cheking
    
    func checking() {
        print("Quize@@@@@@@@@@@@@@@@@@@@@whichGame:\(player.wchiGame) @@@@@@@@@@@@@@name:\(player.playerName)@@@@@@@@@@@@@@@@@@@@\(player.playerScore) @@@@@@@@@@@@@name of Game: \(player.nameGame) with love, and numberOfQuestions \(player.totalQuestion) how many Q. to win \(player.winnerScore) and loose \(player.looserScore)")
    }
    ///
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? FinalVC {
        vc.player = self.player
        }
        if let vcWinner = segue.destination as? WinnerVC {
            vcWinner.player = self.player
        }
    }
    
    //MARK: timer
    
    @IBOutlet var timerView: UIProgressView!
    var seconds      = 20
    var timerOn      = true
    var timer        = Timer()
    var poseDuration = 20
    
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(QuizeCollectionVC.counter), userInfo: nil, repeats: true)
    }
    func counter() {
        if timerOn == true {
            seconds -= 1
            timerView.progress = Float(seconds) / Float(poseDuration - 1)
            if seconds == 0 {
                currentQuestionIndex += 1
                timerOn = false
                
                
                guard currentQuestionIndex < player.totalQuestion else {
                    print("don't go ")
                    self.player.playerScore = score
                    
                    if score == player.winnerScore {
                        performSegue(withIdentifier: "winnerVC", sender: self)
                    }
                    
                    performSegue(withIdentifier: "ShowResult", sender: score)
                    return
                }
                currentQuestion = questionList?[currentQuestionIndex]
            }
        }
    }

    
}

extension QuizeCollectionVC : UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if player.nameGame == player.wchiGame[0] {
            let selectedAnswer = currentQuestion?.answers[indexPath.row]
            if currentQuestion?.answerIsCorrect(answer: selectedAnswer) ?? false {
                score += 1
            }
            
            
            print("ячейка c индексом\(indexPath) выбрана, счет \(score)")
            currentQuestionIndex += 1
            guard currentQuestionIndex < player.totalQuestion else {
                print("don't go ")
                self.player.playerScore = score
                
                if score == player.winnerScore {
                    performSegue(withIdentifier: "winnerVC", sender: self)
                }
                
                performSegue(withIdentifier: "ShowResult", sender: score)
                return
            }
        }
            
            
        else if player.nameGame == player.wchiGame[1] {
            let selectedAnswer = currentQuestion?.answers[indexPath.row]
            if currentQuestion?.answerIsCorrect(answer: selectedAnswer) ?? false {
                score += 1
            }
            print("ячейка c индексом\(indexPath) выбрана, счет \(score)")
            currentQuestionIndex += 1
            guard currentQuestionIndex < player.totalQuestion else {
                print("don't go ")
                self.player.playerScore = score
                
                if score > player.winnerScore {
                    performSegue(withIdentifier: "winnerVC", sender: self)
                }
                
                performSegue(withIdentifier: "ShowResult", sender: score)
                return
            }
        }
        else if player.nameGame == player.wchiGame[2] {
            let selectedAnswer = currentQuestion?.answers[indexPath.row]
            if currentQuestion?.answerIsCorrect(answer: selectedAnswer) ?? false {
                score += 1
            }
            print("ячейка c индексом\(indexPath) выбрана, счет \(score)")
            currentQuestionIndex += 1
            guard currentQuestionIndex < player.totalQuestion else {
                print("don't go ")
                
                if score >= player.winnerScore {
                    performSegue(withIdentifier: "winnerVC", sender: self)
                }
                performSegue(withIdentifier: "ShowResult", sender: score)
                return
            }
        }
        currentQuestion = questionList?[currentQuestionIndex]
    }
    
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
