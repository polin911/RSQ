//
//  EmojiVC.swift
//  RybaSushiQuize
//
//  Created by Polina on 30.08.17.
//  Copyright © 2017 Polina. All rights reserved.
//

import UIKit
import Spring

class EmojiVC: UIViewController {
    
    var player = Player()
    var correctAnswer = false
    var checkArray = false
    
    //BubbleScore
    @IBOutlet var bubleScoreImg: SpringImageView!
    @IBOutlet var numberScoreBubleLbl: SpringLabel!
    
    //ScoreRolliLife
    @IBOutlet var rolliScore: UIImageView!
    var scoreLife = 3
    
    
    @IBOutlet var showCorrectCollection: UICollectionView!
    @IBOutlet var collectionCountW: UICollectionView!
    @IBOutlet var imageKindOfG: UIImageView!
    @IBOutlet var imageEmogi: SpringImageView!
    @IBOutlet var textFieldWord: UITextField!
    
    //Show Correct
    var showCorrectCollectionBool = false
    @IBOutlet var showCorrectBtn: UIButton!
    @IBAction func showCorrectBtnPressed(_ sender: Any) {
        
        bubleScoreImg.isHidden         = true
        numberScoreBubleLbl.isHidden   = true
        
        showCorrectCollection.isHidden = true
        showCorrectBtn.isHidden        = true
        
        //
        currentQuestionIndex += 1
        currentQuestion = questionList?[currentQuestionIndex]
    }
    
    //
    var isOnScreen: Bool {
        return isViewLoaded && view.window != nil
    }
    var currentQuestionIndex = 0
    var score = 0
    
    var currentQuestion: Emoji? {
        didSet {
            updateView()
        }
    }
    
    var questionList: [Emoji]? {
        didSet {
          //
            currentQuestionIndex = 0
            score = 0
            currentQuestion = questionList?.first
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadData()
        cheking()

    }
    

    
    func loadData() {
        
       
        //TextField 
        textFieldWord.autocorrectionType = .no
        textFieldWord.autocapitalizationType = .none
        
        showCorrectCollection.delegate   = self
        showCorrectCollection.dataSource = self
        
        collectionCountW.delegate   = self
        collectionCountW.dataSource = self
        
        let loader = DataLoaderEmoji()
        let result = loader.loadData(fileName: "Игра на устрицы с шампанским")
        
        self.title = result.quizeName
        self.questionList = result.questions
        //TextField
        textFieldWord.enablesReturnKeyAutomatically = true
        textFieldWord.delegate = self
    }
    
    private func updateView() {
        let sectionToReload = IndexSet(integer: 0)
        self.collectionCountW.reloadSections(sectionToReload)
        let duration = isOnScreen ? 0.8 : 4
        UIView.animate(withDuration: duration, animations: { 
            self.imageEmogi.alpha = 0
        }) { (finished) in
            self.imageEmogi.image = self.currentQuestion?.imageE
            
            UIView.animate(withDuration: duration, animations: { 
                self.imageEmogi.alpha = 1
            }, completion: nil)
            
        }
        
    }
    
    func checkCorrect() {
        
        if textFieldWord.text == currentQuestion?.correctWord {
       
            showCorrectCollectionBool = true
            correctAnswer = true
            score += 1
            //BubleScore
            numberScoreBubleLbl.text      = "\(score)"
            numberScoreBubleLbl.animation = "pop"
            numberScoreBubleLbl.duration  = 4
            numberScoreBubleLbl.animate()
            bubleScoreImg.animation       = "pop"
            bubleScoreImg.duration        = 4
            bubleScoreImg.animate()
            showCorrectBtn.isHidden        = false
            showCorrectCollection.isHidden = false
            
            bubleScoreImg.isHidden         = false
            numberScoreBubleLbl.isHidden   = false
            print("score:\(score)")
            
        } else {
            correctAnswer = false
            imageEmogi.animation = "shake"
            imageEmogi.duration = 2
            imageEmogi.animate()
        
             print("dont go")
            print("number:\(currentQuestionIndex)score: \(scoreLife)")
        }
        
    }
    //ShowScore

    func showScoreLife() {
        switch scoreLife {
        case 3:
            rolliScore.image = #imageLiteral(resourceName: "3RollaScore")
        case 2:
            rolliScore.image = #imageLiteral(resourceName: "2RollaScore")
        case 1:
            rolliScore.image = #imageLiteral(resourceName: "1RollScore")
        default:
            rolliScore.image = #imageLiteral(resourceName: "0RollaScore")
            
        }
    }
    
    @IBAction func buttonCheck(_ sender: Any) {
      
        checkArray = true
        checkCorrect()

        self.player.playerScore = score
        if correctAnswer == false {
            scoreLife -= 1
            showScoreLife()
        }

        if score == 5 {
            performSegue(withIdentifier: "EmojiWinner", sender: self)
            print("you are winner")
        }
        if currentQuestionIndex == 10 {
            performSegue(withIdentifier: "EmojiFinal", sender: self)
            print("game over")
        }
        if scoreLife == -1 {
            performSegue(withIdentifier: "EmojiFinal", sender: self)
            print("game over")
        }
    
        textFieldWord.text = ""
        showCorrectCollection.reloadData()
            return
         
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vcWiner = segue.destination as? WinnerVC {
            vcWiner.player = self.player
        }
        if let vcFinal = segue.destination as? FinalVC {
            vcFinal.player = self.player
        }
    }

    //textField
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textFieldWord.resignFirstResponder()
        //startBtn.isHidden = false
        return(true)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func cheking() {
        print("!!!!!!!!!!!!!!!score:\(score) !!!!! correct : \(currentQuestion?.correctWord), \(currentQuestion?.emojiArray) scoreLifeRolli : \(scoreLife) ")
    }
    
    


}

extension EmojiVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == collectionCountW {
         let cell = collectionCountW.dequeueReusableCell(withReuseIdentifier: "emojiCell", for: indexPath) as! EmojiCollectionViewCell
    
            return cell
        }
        
         if collectionView == showCorrectCollection {
            let cell = showCorrectCollection.dequeueReusableCell(withReuseIdentifier: "showEmojiCell", for: indexPath) as! CorrectEmojiCollectionViewCell
            cell.lblCorrectEmoji.text = currentQuestion?.emojiArray[indexPath.row]
            print("Emoji from collection!!! \(currentQuestion?.emojiArray)")
            return cell
        }
        
        return UICollectionViewCell()
    
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == collectionCountW {
        return currentQuestion?.countOfWords ?? 0
        } else {
            return currentQuestion?.countOfWords ?? 0
        }
        
    }
}

extension EmojiVC: UICollectionViewDelegate {
    
    
}

extension EmojiVC: UITextFieldDelegate {
    
}
