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
    
    private var expression = Expression.getRandomExpression()
    private var timer = Timer()
    
    private var progress = 10 {
        didSet {
            timerLabel.text = String(progress)
        }
    }
    private var score = 0 {
        didSet {
            scoreLabel.text = String(score)
        }
    }
    private var correctButton = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupGameScreen(withStartButton: true)
        progressView.setProgress(Float(progress) / 10, animated: false)
        
    }
    
    @IBAction func startPressed() {
        setupGameScreen(withStartButton: false)
        setExpression()
        createTimer()
    }
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        if sender.tag == correctButton {
            setExpression()
            progress = 10
            progressView.setProgress(1, animated: true)
            score += 1
        }
    }
    
    
    private func setupGameScreen(withStartButton boolean: Bool) {
        stackViews.forEach {
            $0.isHidden = boolean
        }
        expressionLabel.isHidden = boolean
        startButton.isHidden = !boolean
        progress = 10
        score = 0
    }
    
    private func setExpression() {
        expression = Expression.getRandomExpression()
        expressionLabel.text = expression.expression
        setButtons()
    }
    
    private func setButtons() {
        correctButton = Int.random(in: 0...3)
        answerButtons.forEach {
            if $0.tag == correctButton {
                $0.setTitle(String(expression.result), for: .normal)
            } else {
                $0.setTitle(String(Expression.getRandomExpression().result), for: .normal)
            }
        }
    }
    
    private func createTimer() {
        timer = Timer.scheduledTimer(
            timeInterval: 1,
            target: self,
            selector: #selector(setProgressView),
            userInfo: nil,
            repeats: true
        )
    }
    
    @objc
    private func setProgressView() {
        progress -= 1
        progressView.setProgress(Float(progress) / 10, animated: true)
        print(progress)
        print(progressView.progress)
        if progress < 1 {
            timer.invalidate()
            let ac = UIAlertController(title: "OK", message: "Ваш результат: \(score)", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default) { _ in
                self.setupGameScreen(withStartButton: true)
            }
            ac.addAction(okAction)
            present(ac, animated: true)
        }
    }
    
}
