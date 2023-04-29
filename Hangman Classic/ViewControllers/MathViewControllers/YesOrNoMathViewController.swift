//
//  YesOrNoMathViewController.swift
//  Hangman Classic
//
//  Created by Степан Фоминцев on 28.04.2023.
//

import UIKit

final class YesOrNoMathViewController: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet private var stackView: UIStackView!
    @IBOutlet private var buttons: [UIButton]!
    
    @IBOutlet private var progressView: UIProgressView!
    @IBOutlet private var timerLabel: UILabel!
    @IBOutlet private var scoreLabel: UILabel!
    @IBOutlet private var expressionLabel: UILabel!
    
    @IBOutlet private var gameNameLabel: UILabel!
    @IBOutlet private var startButton: UIButton!
    
    // MARK: - Private Properties
    private var expressionDifficulty = 1
    private var correctAnswer = 0
    private var expression = Expression.getRandomExpression(withDifficulty: 1)
    private var timer = Timer()
    
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
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupGameScreen(withStartButton: true)
    }
    
    // MARK: - IB Actions
    @IBAction private func startPressed() {
        setupGameScreen(withStartButton: false)
        setExpression()
        createTimer()
    }
    
    @IBAction private func answerPressed(_ sender: UIButton) {
        if sender.tag == correctAnswer {
            setExpression()
            score += 1
            progress = 1000
        } else {
            stopTheGame(withTitle: "Неправильный ответ")
        }
    }
    
    @IBAction private func rulesPressed(_ sender: UIBarButtonItem) {
        let text = """
            В данной игре вы испытаете свои математические способности.
            
            У Вас будет 10 секунд, чтобы определить, верное ли выражение. Также если Вы выберите неправильный ответ, игра остановится.
            
            Через определенное количество(секретная информация) набранных очков уровень сложности будет повышаться!
            
            Успехов!
            """
        let ac = UIAlertController(title: "Правила", message: text, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Понял", style: .default)
        ac.addAction(okAction)
        present(ac, animated: true)
    }
    
}

// MARK: - Game logic methods
private extension YesOrNoMathViewController {
    func setupGameScreen(withStartButton boolean: Bool) {
        buttons.forEach {
            $0.isHidden = boolean
        }
        stackView.isHidden = boolean
        expressionLabel.isHidden = boolean
        startButton.isHidden = !boolean
        gameNameLabel.isHidden = !boolean
        progress = 1000
        score = 0
        expressionDifficulty = 1
    }
    
    func setExpression() {
        expression = Expression.getRandomExpression(withDifficulty: expressionDifficulty)
        if Int.random(in: 1...2) > 1 {
            correctAnswer = 1
            expressionLabel.text = expression.fullExpression
        } else {
            correctAnswer = 0
            expressionLabel.text = "\(expression.firstNumber) \(expression.operationType.rawValue) \(expression.secondNumber) = \([expression.result - Int.random(in: 1...10), expression.result + Int.random(in: 1...10)].randomElement() ?? 0)"
        }
    }
    
    func createTimer() {
        timer = Timer.scheduledTimer(
            timeInterval: 0.01,
            target: self,
            selector: #selector(setProgressView),
            userInfo: nil,
            repeats: true
        )
    }
    
    func stopTheGame(withTitle title: String) {
        timer.invalidate()
        showOkAlert(title: title, message: "Ваш результат: \(score)\nСложность: \(expressionDifficulty)") { _ in
            self.setupGameScreen(withStartButton: true)
        }
    }
    
    @objc func setProgressView() {
        progress -= 1
        progressView.setProgress(Float(progress) / 1000, animated: true)
        if progress < 1 {
            stopTheGame(withTitle: "Время вышло")
        }
    }
}
