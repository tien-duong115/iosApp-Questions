//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionText: UILabel!
    @IBOutlet weak var progressbar: UIProgressView!
    @IBOutlet weak var tryAgain: UIButton!
    
    var quizBrain = QuizBrain()
    
    @IBAction func answerButton(_ sender: UIButton) {
        if quizBrain.currentQuestionNumber >= quizBrain.quiz.count { return }
        let userAnswer = sender.currentTitle ?? ""
        let ifCorrect = quizBrain.checkAnswer(userAnswer)        
        if ifCorrect {
                questionText.text = "Right!"
                sender.backgroundColor = UIColor.green
            } else {
                questionText.text = "Wrong!"
                sender.backgroundColor = UIColor.red
            }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5)
        {
            sender.backgroundColor = UIColor.clear
            self.updateUI()
        }
    }
    
    func updateUI() {
        quizBrain.currentQuestionNumber += 1
        
        let isQuizCompleted = quizBrain.quizCompleted()
        
        if isQuizCompleted {
            questionText.text = "Finish!"
            quizBrain.hideTFButton(in: self.view)
            tryAgain.isHidden = false
            
        } else {
            questionText.text = quizBrain.getQuestionText()
            tryAgain.isHidden = true
        }
        progressbar.progress = Float(quizBrain.currentQuestionNumber + 1) / Float(quizBrain.quiz.count)
    }
    
    @IBAction func retry(_ sender: UIButton) {
        quizBrain.currentQuestionNumber = 0
        quizBrain.unhideTFButton(in: self.view)
        updateUI()
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        questionText.text = quizBrain.getQuestionText()
        progressbar.progress = quizBrain.updateProgressBar()
        tryAgain.isHidden = true

    }
}
