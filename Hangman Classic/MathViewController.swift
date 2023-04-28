//
//  MathViewController.swift
//  Hangman Classic
//
//  Created by Степан Фоминцев on 25.04.2023.
//

import UIKit

final class MathViewController: UIViewController {
    
    // MARK: - Public Properties
    var gameDescription: GameDescription!
    
    // MARK: - IBOutlets
    @IBOutlet private var answerButtons: [UIButton]!
    @IBOutlet private var stackViews: [UIStackView]!
    
    @IBOutlet private var startButton: UIButton!
    @IBOutlet private var gameNameLabel: UILabel!
    @IBOutlet private var expressionLabel: UILabel!
    @IBOutlet private var progressView: UIProgressView!
    @IBOutlet private var timerLabel: UILabel!
    @IBOutlet private var scoreLabel: UILabel!
    
    // MARK: - Private Properties
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
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupGameScreen(withStartButton: true)
        progressView.progress = Float(progress) / 1000
    }
    
    // MARK: - IBActions
    @IBAction private func startPressed() {
        setupGameScreen(withStartButton: false)
        setExpression()
        createTimer()
    }
    
    @IBAction private func answerButtonPressed(_ sender: UIButton) {
        if sender.tag == correctButton {
            setExpression()
            progress = 1000
            score += 1
            sender.tintColor = .green
        } else {
            stopTheGame(withMessage: "Вы ошиблись")
        }
    }
    
    @IBAction func rulesPressed(_ sender: UIBarButtonItem) {
        let text = """
            В данной игре вы испытаете свои математические способности.
            
            У Вас будет 10 секунд, чтобы нажать на правильный ответ. Также если вы выберите неправильный ответ, игра остановится.
            
            Через определенное количество(секретная информация) набранных очков уровень сложности будет повышаться!
            
            Успехов!
            """
        let ac = UIAlertController(title: "Правила", message: text, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Понял", style: .default)
        ac.addAction(okAction)
        present(ac, animated: true)
    }
    
    // MARK: - Private Methods
    private func setupGameScreen(withStartButton boolean: Bool) {
        stackViews.forEach {
            $0.isHidden = boolean
        }
        expressionLabel.isHidden = boolean
        startButton.isHidden = !boolean
        gameNameLabel.isHidden = !boolean
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
        var i = 0
        correctButton = Int.random(in: 0...3)
        let operationTypes = Array(OperationType.allCases)
        answerButtons.forEach {
            switch expression.expressionType {
            case .operand:
                if $0.tag == correctButton {
                    $0.setTitle(String(expression.secondNumber), for: .normal)
                } else {
                    if Int.random(in: 1...10) > 5 {
                        $0.setTitle(String(expression.secondNumber - Int.random(in: 1...10)), for: .normal)
                    } else {
                        $0.setTitle(String(expression.secondNumber + Int.random(in: 1...10)), for: .normal)
                    }
                }
            case .operationType:
                $0.setTitle(operationTypes[i].rawValue, for: .normal)
                if operationTypes[i] == expression.operationType {
                    correctButton = i
                }
                i += 1
            case .result:
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
    
    // MARK: - Objective-C Methods
    @objc
    private func setProgressView() {
        progress -= 1
        progressView.setProgress(Float(progress) / 1000, animated: true)
        if progress < 1 {
            stopTheGame(withMessage: "Время вышло")
        }
    }
    
}
