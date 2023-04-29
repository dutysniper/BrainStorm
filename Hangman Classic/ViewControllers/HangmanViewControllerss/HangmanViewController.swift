//
//  ViewController.swift
//  Hangman Classic
//  Created by Константин Натаров on 23.04.2023.

import UIKit

//MARK: - HangmanViewContollerDelegate Protocol
protocol HangmanViewControllerDelegate: AnyObject {
    func gameIsOver()
}

final class HangmanViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet private var secretWordLabel: UILabel!
    @IBOutlet private var difficultyLabel: UILabel!
    @IBOutlet private var hangmanImage: UIImageView!
    
    @IBOutlet private var livesImages: [UIImageView]!
    @IBOutlet private var keyBoardButtons: [UIButton]!
    
    //MARK: - Class properties
    weak var delegate: HangmanViewControllerDelegate?
    var game: HangmanGame!
    private var numberOfErrors = 0
    private var secretWord = "" {
        didSet {
            secretWordLabel.text = secretWord.map { String($0) }.joined(separator: " ")
        }
    }
    private var isWordComplete: Bool {
        !secretWord.contains("_")
    }
    
    //MARK: - Life-cycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateUI()
    }
    
    //MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let gameOverVC = segue.destination as? GameOverViewController else { return }
        
        gameOverVC.delegate = self
        gameOverVC.word = game.word
        gameOverVC.result = isWordComplete 
        ? game.gameResult.first
        : game.gameResult.last
    }
    
    //MARK: - IBActions
    @IBAction private func keyBoardButtonPressed(_ sender: UIButton) {
        let letter = sender.titleLabel?.text?.lowercased() ?? " "
        if game.word.contains(letter) {
            setCorrectLetter(letter: letter)
            sender.layer.borderColor = UIColor.green.cgColor
        } else if numberOfErrors < livesImages.count {
            setIncorrectLetter()
            sender.layer.borderColor = UIColor.red.cgColor
        }
        
        sender.isEnabled = false
        sender.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.07267296393)
        sender.layer.borderWidth = 3
        sender.layer.cornerRadius = min(sender.bounds.width, sender.bounds.height) / 2
        sender.layer.masksToBounds = true
        
        UIView.animate(withDuration: 0.5, animations: {
            sender.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        }) { _ in
            UIView.animate(withDuration: 0.5) {
                sender.transform = CGAffineTransform.identity
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            UIButton.animate(withDuration: 0.5, animations: {
                sender.alpha = 0.0
            }) { _ in
                if self.isWordComplete || self.numberOfErrors == self.livesImages.count {
                    self.keyBoardButtons.forEach { button in
                        button.isEnabled = false
                    }
                    self.performSegue(withIdentifier: "showGameOver", sender: sender)
                }
            }
        }
    }
}

//MARK: - Private methods for letters
extension HangmanViewController {
    
    private func setCorrectLetter(letter: String) {
        var _word = ""
        for (wordChar, secretChar) in zip(game.word, secretWord) {
            _word += (String(wordChar) == letter && String(secretChar) == "_") ? letter : String(secretChar)
        }
        secretWord = _word
    }
    
    private func setIncorrectLetter() {
        numberOfErrors += 1
        if traitCollection.userInterfaceStyle == .light {
            hangmanImage.image = UIImage(named: game.gameProgress[numberOfErrors - 1].rawValue)
        } else {
            hangmanImage.image = invertImageColor(game.gameProgress[numberOfErrors - 1].rawValue)
        }
        livesImages[numberOfErrors - 1].alpha = 0.2
    }
}

//MARK: - Setup UI
extension HangmanViewController {
    private func updateUI() {
        print(game.word)
        numberOfErrors = 0
        hangmanImage.image = .none
        secretWord = game.word.map { _ in "_" }.joined()
        difficultyLabel.text = "Сложность: \(game?.difficulty.rawValue ?? "")"
        livesImages.forEach { live in
            live.alpha = 1
        }
        keyBoardButtons.forEach { button in
            button.isEnabled = true
            button.alpha = 1
            button.layer.borderColor = .none
            button.layer.borderWidth = 0
            button.layer.removeAllAnimations()
            button.backgroundColor = .none
        }
    }
}

//MARK: GameOverViewContollerDelegate methods
extension HangmanViewController: GameOverViewControllerDelegate {
    func gameIsOver() {
        dismiss(animated: true) { [weak self] in
            self?.delegate?.gameIsOver()
        }
    }
    
    func changeDifficulty() {
        dismiss(animated: true)
    }
}

