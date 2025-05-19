//
//  QuizBrain.swift
//  Quizzler-iOS13
//
//  Created by tien_duong on 5/18/25.
//  Copyright © 2025 The App Brewery. All rights reserved.
//

import Foundation
import UIKit

struct QuizBrain {
    let quiz =
    [
        Question(q: "A slug's blood is green.", a: "True"),
        Question(q: "Approximately one quarter of human bones are in the feet.", a: "True"),
        Question(q: "The total surface area of two human lungs is approximately 70 square metres.", a: "True"),
        Question(q: "In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.", a: "True"),
        Question(q: "In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.", a: "False"),
        Question(q: "It is illegal to pee in the Ocean in Portugal.", a: "True"),
        Question(q: "You can lead a cow down stairs but not up stairs.", a: "False"),
        Question(q: "Google was originally called 'Backrub'.", a: "True"),
        Question(q: "Buzz Aldrin's mother's maiden name was 'Moon'.", a: "True"),
        Question(q: "The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.", a: "False"),
        Question(q: "No piece of square dry paper can be folded in half more than 7 times.", a: "False"),
        Question(q: "Chocolate affects a dog's heart and nervous system; a few ounces are enough to kill a small dog.", a: "True")
    ]
    
    var currentQuestionNumber = 0
    
    func checkAnswer(_ userAnswer: String) -> Bool {
        if userAnswer == quiz[currentQuestionNumber].a {
            return true
        }
        else {
            return false
        }
    }
    
    func getQuestionText() -> String {
        return quiz[currentQuestionNumber].q
    }
    
    func quizCompleted() -> Bool {
        if currentQuestionNumber >= quiz.count {
            return true
        }
        else {
            return false
        }
    }
    
    func hideTFButton(in rootView: UIView) {
        func hideButtons(in view: UIView) {
            for subview in view.subviews {
                if let button = subview as? UIButton,
                   let title = button.currentTitle,
                   title == "True" || title == "False" {
                    button.isHidden = true
                } else {
                    hideButtons(in: subview) // Recursively check subviews
                }
            }
        }

        hideButtons(in: rootView)
    }
    
    func unhideTFButton(in rootView: UIView) {
        func hideButtons(in view: UIView) {
            for subview in view.subviews {
                if let button = subview as? UIButton,
                   let title = button.currentTitle,
                   title == "True" || title == "False" {
                    button.isHidden = false
                } else {
                    hideButtons(in: subview) // Recursively check subviews
                }
            }
        }

        hideButtons(in: rootView)
    }
    
    func updateProgressBar() -> Float {
        return Float(currentQuestionNumber + 1) / Float(quiz.count)
    }
    
}
