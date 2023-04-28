//
//  YesOrNoMathViewController.swift
//  Hangman Classic
//
//  Created by Степан Фоминцев on 28.04.2023.
//

import UIKit

final class YesOrNoMathViewController: UIViewController {

    @IBOutlet var stackView: UIStackView!
    
    @IBOutlet var buttons: [UIButton]!
    @IBOutlet var timerLabel: UILabel!
    @IBOutlet var progressView: UIProgressView!
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var expressionLabel: UILabel!
    
    private var progress = 1000
    private var score = 0 {
        didSet {
            scoreLabel.text = String(score)
        }
    }
    private var expressionDifficulty = 1
    private var correctAnswer = 0
    private var expression = Expression.getRandomExpression(withDifficulty: 1)
    
    @IBOutlet var startButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupGameScreen(withStartButton: true)
    }
    
    @IBAction func startPressed() {
        setupGameScreen(withStartButton: false)
        setExpression()
    }
    
    @IBAction func answerPressed(_ sender: UIButton) {
        if sender.tag == correctAnswer {
            score += 1
        }
        setExpression()
    }
    
    private func setupGameScreen(withStartButton boolean: Bool) {
        buttons.forEach {
            $0.isHidden = boolean
        }
        stackView.isHidden = boolean
        expressionLabel.isHidden = boolean
        startButton.isHidden = !boolean
        progress = 1000
        score = 0
        expressionDifficulty = 1
    }
    
    private func setExpression() {
        expression = Expression.getRandomExpression(withDifficulty: expressionDifficulty)
        if Int.random(in: 1...2) > 1 {
            correctAnswer = 1
            expressionLabel.text = expression.fullExpression
        } else {
            correctAnswer = 0
            expressionLabel.text = "\(expression.firstNumber) \(expression.operationType.rawValue) \(expression.secondNumber) = \([expression.result - Int.random(in: 1...10), expression.result + Int.random(in: 1...10)].randomElement() ?? 0)"
        }
    }
}
