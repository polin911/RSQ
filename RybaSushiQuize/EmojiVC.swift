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
  
    
    @IBOutlet var showCorrectCollection: UICollectionView!
    @IBOutlet var collectionCountW: UICollectionView!
    @IBOutlet var imageKindOfG: UIImageView!
    @IBOutlet var imageEmogi: SpringImageView!
    @IBOutlet var textFieldWord: UITextField!
    
    //Show Correct
    var showCorrectCollectionBool = false
    @IBOutlet var showCorrectBtn: UIButton!
    @IBAction func showCorrectBtnPressed(_ sender: Any) {
        
        showCorrectCollection.isHidden = true
        showCorrectBtn.isHidden = true
        
        //
        currentQuestionIndex += 1
        let random = questionList?[Int(arc4random_uniform(UInt32((questionList?.count)!)))]
        currentQuestion = random
        
        //
        
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
            let random = questionList?[Int(arc4random_uniform(UInt32((questionList?.count)!)))]
            currentQuestionIndex = 0
            score = 0
            currentQuestion = random
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadData()
        cheking()

    }
    

    
    func loadData() {
        
        showCorrectCollection.delegate   = self
        showCorrectCollection.dataSource = self
        
        collectionCountW.delegate   = self
        collectionCountW.dataSource = self
        
        let loader = DataLoaderEmoji()
        let result = loader.loadData(fileName: "Игра на устрицы с шампанским")
        
        self.title = result.quizeName
        self.questionList = result.questions
        //textField
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
            showCorrectBtn.isHidden = false
            showCorrectCollection.isHidden = false
            print("score:\(score)")
            
        } else {

            correctAnswer = false
            imageEmogi.animation = "shake"
            imageEmogi.duration = 2
            imageEmogi.animate()
             print("dont go")
            print("number:\(currentQuestionIndex)")
        }
        
    }

    
    @IBAction func buttonCheck(_ sender: Any) {
      
        checkArray = true
        checkCorrect()
        
        currentQuestionIndex += 1
       
            
            self.player.playerScore = score
        
        let random = questionList?[Int(arc4random_uniform(UInt32((questionList?.count)!)))]
        // to next question
        //currentQuestion = random
        
        if score == 5 {
            performSegue(withIdentifier: "EmojiWinner", sender: self)
            print("you are winner")
        }
        if currentQuestionIndex == 10 {
            performSegue(withIdentifier: "EmojiFinal", sender: self)
            print("game over")
        }
        textFieldWord.text = ""
            return
         
       
//        performSegue(withIdentifier: "EmojiFinal", sender: self)
//        return
        
        
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
        print("!!!!!!!!!!!!!!!score:\(score) !!!!! correct : \(currentQuestion?.correctWord ?? nil), \(currentQuestion?.emojiArray) ")
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
