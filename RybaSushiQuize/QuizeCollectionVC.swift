//
//  QuizeCollectionVC.swift
//  RybaSushiQuize
//
//  Created by Polina on 20.06.17.
//  Copyright © 2017 Polina. All rights reserved.
//

import UIKit
import GameplayKit
import Spring
import SCLAlertView

class QuizeCollectionVC: UIViewController {
    
    var quizeCell = WhichQuizeCollectionCell()
    
    var tokenActionBool = true
    var wrongAnswer = true
    var changeSizeFish = true
    var player = Player()
    
    //MARK: RolliScore
    
    @IBOutlet var correctIncorectLBL: UILabel!
    var scoreRolliActionBool = true
    var rolliScore = 3
    @IBOutlet var rolliScoreImg: SpringImageView!
    var rolliScoreSushi = 2
    
    //MARK: Token
    @IBOutlet var visibleScoreSpr: SpringLabel!
    @IBOutlet var visibleFishSpr: SpringImageView!
    
    @IBOutlet var tokenImg: UIButton!
    @IBOutlet var appBackSpr: SpringImageView!
    
    @IBOutlet var rybaScoreImgSpr: SpringImageView!
    
    @IBOutlet var scoreLbl: SpringLabel!
    @IBOutlet var questionLbl: UILabel!
    @IBOutlet var questionImg: UIImageView!
    @IBOutlet var collectionV: UICollectionView!
    
    //MARK: TokenAction
    
    @IBAction func tokenAction(_ sender: Any) {
        correctIncorectLBL.isHidden = true
        tokenImg.isHidden = true
        visibleScoreSpr.isHidden = true
        visibleFishSpr.isHidden = true
        //
        rolliScoreImg.isHidden = true
        if rolliScore == 0 {
            performSegue(withIdentifier: "ShowResult", sender: score)
        }
        
        timerOn = true
    }
    
    
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
            //let random = questionList?[Int(arc4random_uniform(UInt32((questionList?.count)!)))]
            let randomQ = GKShuffledDistribution.d6()
            let random = questionList?[randomQ.nextInt()]
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
        let result = loader.loadData(fileName: player.nameGame)
        
        self.title = result.quizeName
        self.questionList = result.questions
        
        self.rolliScore = player.scoreLife
    }
    
    private func updateView() {
        
        //timer:
        
        //timerOn = true
        
        //tokenWorks()
        seconds = 20
        
        let sectionToReload = IndexSet(integer: 0)
        self.scoreLbl.text = "\(score)"
        self.collectionV.reloadSections(sectionToReload)
        
        let duration = isOnScreen ? 0.2 : 0
        UIView.animate(withDuration: duration, animations: {
            
            self.questionLbl.alpha = 0
        }) { (finished) in
            self.questionLbl.text = self.currentQuestion?.title
            
            
            UIView.animate(withDuration: duration, animations: {
                self.questionLbl.alpha = 1
                
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
                rolliScore -= 1
                rolliScoreLife()
                
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
            if currentQuestion?.answerIsCorrect(answer: selectedAnswer) == true {
                score += 1
                //
                changeSizeFishImg()
                //
                tokenWorks()
            }
            if currentQuestion?.answerIsCorrect(answer: selectedAnswer) == false {
                wrongSpr()
                //
                rolliScore -= 1
                rolliScoreLife()
            }
            
            print("ячейка c индексом\(indexPath) выбрана, счет \(score), score\(rolliScore)")
            currentQuestionIndex += 1
            guard currentQuestionIndex < player.totalQuestion else {
                print("don't go ")
                self.player.playerScore = score
                
                if score == player.winnerScore {
                    self.player.winGame = self.player.nameGame
                    performSegue(withIdentifier: "winnerVC", sender: self)
                }
                
                
                // performSegue(withIdentifier: "ShowResult", sender: score)
                return
            }
        }
            
            
        else if player.nameGame == player.wchiGame[1] {
            
            let selectedAnswer = currentQuestion?.answers[indexPath.row]
            if currentQuestion?.answerIsCorrect(answer: selectedAnswer) == true {
                score += 1
                //
                changeSizeFishImg()
                //
                tokenWorks()
            }
            if currentQuestion?.answerIsCorrect(answer: selectedAnswer) == false {
                wrongSpr()
                //
                rolliScore -= 1
                rolliScoreLife()
            }
            
            print("ячейка c индексом\(indexPath) выбрана, счет \(score), score\(rolliScore)")
            currentQuestionIndex += 1
            guard currentQuestionIndex < player.totalQuestion else {
                print("don't go ")
                self.player.playerScore = score
                
                if score >= player.winnerScore {
                    self.player.winGame = self.player.nameGame
                    performSegue(withIdentifier: "winnerVC", sender: self)
                }
                
                
                // performSegue(withIdentifier: "ShowResult", sender: score)
                return
            }
        }
        else if player.nameGame == player.wchiGame[2] {
            let selectedAnswer = currentQuestion?.answers[indexPath.row]
            if currentQuestion?.answerIsCorrect(answer: selectedAnswer) == true {
                score += 1
                //
                changeSizeFishImg()
                //
                tokenWorks()
            }
            if currentQuestion?.answerIsCorrect(answer: selectedAnswer) == false {
                wrongSpr()
                //
                rolliScore -= 1
                rolliScoreLife()
            }
            
            print("ячейка c индексом\(indexPath) выбрана, счет \(score), score\(rolliScore)")
            currentQuestionIndex += 1
            guard currentQuestionIndex < player.totalQuestion else {
                print("don't go ")
                self.player.playerScore = score
                
                if score >= player.winnerScore {
                    self.player.winGame = self.player.nameGame
                    performSegue(withIdentifier: "winnerVC", sender: self)
                }
                
                
                // performSegue(withIdentifier: "ShowResult", sender: score)
                return

                
            }
        }
        
        // let randomDistribution = GKShuffledDistribution.init(lowestValue: 1, highestValue: (questionList?.count)! - 1 )
        
        
        //currentQuestion = questionList?[randomDistribution.nextInt()]
        // let questionRandom = questionList?.count.random.nextInt()
        //GKShuffledDistribution(lowestValue: 1, highestValue: (questionList?.count)!)
        let random = questionList?[Int(arc4random_uniform(UInt32((questionList?.count)!)))]
        
        //currentQuestion = random
        
        //let randomQ = GKShuffledDistribution.d20()
        currentQuestion = random
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
        let answerText = currentQuestion?.answers[indexPath.row]
        cell.answersLbl.text = answerText
        
        if cell.selectedBackgroundView == nil {
            cell.selectedBackgroundView = UIView()
            cell.selectedBackgroundView?.translatesAutoresizingMaskIntoConstraints = false
            cell.selectedBackgroundView?.frame = cell.contentView.bounds
        }
        let isRightAnswer = currentQuestion?.answerIsCorrect(answer: answerText) ?? false
        cell.selectedBackgroundView?.backgroundColor = isRightAnswer ? .yellow : .red
        return cell
    }
    
    //MARK: Token and Score
    
    func changeSizeFishImg() {
        changeSizeFish = true
        if changeSizeFish == true {
            visibleFishSpr.animation = "pop"
            visibleFishSpr.duration = 4
            visibleFishSpr.animate()
            
            visibleScoreSpr.animation = "pop"
            visibleScoreSpr.duration = 4
            visibleScoreSpr.animate()
            
        }
        changeSizeFish = false
    }
    func wrongSpr() {
        wrongAnswer = true
        if wrongAnswer == true {
            rybaScoreImgSpr.animation = "shake"
            rybaScoreImgSpr.duration = 1
            rybaScoreImgSpr.animate()
            
            scoreLbl.animation = "shake"
            scoreLbl.duration = 1
            scoreLbl.animate()
            
            
        }
        wrongAnswer = false
    }
    
    func tokenWorks() {
        tokenActionBool = true
        if tokenActionBool {
            // let answerText = currentQuestion?.answers[currentQuestionIndex]
            visibleScoreSpr.text = "Score: \(score)"
            tokenImg.isHidden = false
            visibleFishSpr.isHidden = false
            visibleScoreSpr.isHidden = false
            timerOn = false
            
        }
        // tokenActionBool = false
    }
    
    func rolliScoreLife() {
        
        scoreRolliActionBool = true
        //timerOn = false
        
        if scoreRolliActionBool {
//            scoreLbl.isHidden = true
//            rybaScoreImgSpr.isHidden = true
            
            timerOn = false
            rolliScoreImg.isHidden = false
            tokenImg.isHidden = false
            correctIncorectLBL.isHidden = false
            
            
            switch rolliScore {
            case 3:
                rolliScoreImg.image = #imageLiteral(resourceName: "3RollaScore")
                rolliScoreImg.animation = "shake"
                rolliScoreImg.duration  = 3
                rolliScoreImg.animate()
            case 2:
                rolliScoreImg.image = #imageLiteral(resourceName: "2RollaScore")
                rolliScoreImg.animation = "shake"
                rolliScoreImg.duration  = 3
                rolliScoreImg.animate()
            case 1:
                rolliScoreImg.image = #imageLiteral(resourceName: "1RollScore")
                rolliScoreImg.animation = "shake"
                rolliScoreImg.duration  = 3
                rolliScoreImg.animate()
            case 0 :
                rolliScoreImg.image = #imageLiteral(resourceName: "0RollaScore")
                rolliScoreImg.animation = "fall"
                rolliScoreImg.duration  = 7
                rolliScoreImg.animate()
            
            default:
                rolliScoreImg.image = #imageLiteral(resourceName: "3RollaScore")
                
            }
        }
        scoreRolliActionBool = false
        
    }
    
    
    
}
