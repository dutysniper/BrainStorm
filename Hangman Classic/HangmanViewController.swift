//
//  ViewController.swift
//  Hangman Classic
//
//  Created by Константин Натаров on 23.04.2023.
//start create suicide logic

import UIKit

final class HangmanViewController: UIViewController {
    
    @IBOutlet weak var secretWordLabel: UILabel!
    @IBOutlet weak var difficultyLabel: UILabel!
    @IBOutlet weak var hangmanImage: UIImageView!
    
    @IBOutlet var livesImages: [UIImageView]!
    @IBOutlet private var keyBoardButtons: [UIButton]!
    
    var word: Word!
    var numberOfErrors = 0
    var secretWord = "" {
        didSet {
            secretWordLabel.text = secretWord.map { String($0) }.joined(separator: " ")
        }
    }
    var isWordComplete: Bool {
        !secretWord.contains("_")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(word.word)
        secretWord = word.word.map { _ in "_" }.joined()
        difficultyLabel.text = "Сложность: \(word?.difficulty.rawValue ?? "")"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let gameOverVC = segue.destination as? GameOverViewController else { return }

        gameOverVC.result = isWordComplete 
        ? "Успех!"
        : "Поражение!"

        gameOverVC.detail = isWordComplete
        ? word.gameResult.first?.rawValue
        : word.gameResult.last?.rawValue
    }
    
    @IBAction private func keyBoardButtonPressed(_ sender: UIButton) {
        let letter = sender.titleLabel?.text?.lowercased() ?? " "

        if word.word.contains(letter) {
            setCorrectLetter(letter: letter)
        } else {
            setIncorrectLetter()
        }

        sender.isEnabled = false
        sender.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.07267296393)
        sender.layer.borderWidth = 3
        sender.layer.borderColor = [UIColor.red.cgColor, UIColor.green.cgColor].randomElement()

        UIView.animate(withDuration: 0.2, animations: {
            sender.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        }) { _ in
            UIView.animate(withDuration: 0.3) {
                sender.transform = CGAffineTransform.identity
            }
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            UIButton.animate(withDuration: 0.3, animations: {
                sender.alpha = 0.0
            }) { _ in
                if self.isWordComplete || self.numberOfErrors == self.livesImages.count {
                    self.performSegue(withIdentifier: "showGameOver", sender: sender)
                }
            }
        }
    }
   }
extension HangmanViewController {
    
    private func setCorrectLetter(letter: String) {
        var _word = ""
        for (wordChar, secretChar) in zip(word.word, secretWord) {
            _word += (String(wordChar) == letter && String(secretChar) == "_") ? letter : String(secretChar)
        }
        secretWord = _word
    }
    
    private func setIncorrectLetter() {
        numberOfErrors += 1
        hangmanImage.image = UIImage(named: word.gameProgress[numberOfErrors - 1].rawValue)
        livesImages[numberOfErrors - 1].alpha = 0.2
    }
}


