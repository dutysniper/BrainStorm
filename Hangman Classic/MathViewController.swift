//
//  MathViewController.swift
//  Hangman Classic
//
//  Created by Степан Фоминцев on 25.04.2023.
//

import UIKit

class MathViewController: UIViewController {
    
    
    // MARK: - IBOutlets
    @IBOutlet var answerButtons: [UIButton]!
    @IBOutlet var stackViews: [UIStackView]!
    
    @IBOutlet var progressView: UIProgressView!
    @IBOutlet var expressionLabel: UILabel!
    @IBOutlet var startButton: UIButton!
    @IBOutlet var timerLabel: UILabel!
    @IBOutlet var scoreLabel: UILabel!
    
    private var expression = Expression.getRandomExpression(withDifficulty: 1)
    private var expressionDifficulty = 1
    private var timer = Timer()
    private var correctButton = 0
    
    private var progress = 1000 {
        didSet {
            timerLabel.text = round(Double(progress) / 100).formatted(.number)
        }
    }
    private var score = 0 {
        didSet {
            scoreLabel.text = String(score)
            if score > expressionDifficulty * 10 / 3 {
                expressionDifficulty += 2
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupGameScreen(withStartButton: true)
        progressView.progress = Float(progress) / 1000
        
    }
    
    @IBAction func startPressed() {
        setupGameScreen(withStartButton: false)
        setExpression()
        createTimer()
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        print("Difficulty \(expressionDifficulty)")
        print("Score \(score)")
        print(timerLabel.text)
        print(expression.expression)
        if sender.tag == correctButton {
            setExpression()
            progress = 1000
            progressView.setProgress(1, animated: true)
            score += 1
            sender.tintColor = .green
        } else {
            stopTheGame(withMessage: "Вы ошиблись")
        }
    }
    
    
    private func setupGameScreen(withStartButton boolean: Bool) {
        stackViews.forEach {
            $0.isHidden = boolean
        }
        expressionLabel.isHidden = boolean
        startButton.isHidden = !boolean
        progress = 1000
        score = 0
        expressionDifficulty = 1
    }
    
    private func setExpression() {
        expression = Expression.getRandomExpression(withDifficulty: expressionDifficulty)
        expressionLabel.text = expression.expression
        setButtons()
    }
    
    private func setButtons() {
        correctButton = Int.random(in: 0...3)
        answerButtons.forEach {
            if $0.tag == correctButton {
                $0.setTitle(String(expression.result), for: .normal)
            } else {
                if Int.random(in: 1...10) > 5 {
                    $0.setTitle(String(expression.result - Int.random(in: 1...10)), for: .normal)
                } else {
                    $0.setTitle(String(expression.result + Int.random(in: 1...10)), for: .normal)
                }
            }
        }
    }
    
    private func createTimer() {
        timer = Timer.scheduledTimer(
            timeInterval: 0.01,
            target: self,
            selector: #selector(setProgressView),
            userInfo: nil,
            repeats: true
        )
    }
    
    private func stopTheGame(withMessage title: String) {
        timer.invalidate()
        let ac = UIAlertController(title: title, message: "Ваш результат: \(score)\nСложность: \(expressionDifficulty)", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            self.setupGameScreen(withStartButton: true)
        }
        ac.addAction(okAction)
        present(ac, animated: true)
    }
    
    @objc
    private func setProgressView() {
        progress -= 1
        progressView.setProgress(Float(progress) / 1000, animated: true)
        if progress < 1 {
            stopTheGame(withMessage: "Время вышло")
        }
    }
    
}
