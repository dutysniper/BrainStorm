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
    
    @IBOutlet private var keyBoardButtons: [UIButton]!
    
    var word: Word!
    var numberOfErrors = 0
    var correctLetters = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(word.word)
        secretWordLabel.text = word.word
        difficultyLabel.text = "Сложность: \(word?.difficulty.rawValue ?? "")"
        startGame()
    }
    
    @IBAction private func keyBoardButtonPressed(_ sender: UIButton) {
        let letter = sender.titleLabel?.text ?? " "
        print(letter)
        if word.word.contains(letter.lowercased()) {
            correctLetters.append(letter)
            manageCorrectGuess()
        } else {
            manageIncorrectGuess()
        }
    }
}
extension HangmanViewController {
    private func startGame() {
        secretWordLabel.text = String(repeating: "_ ", count: word.word.count).trimmingCharacters(in: .whitespaces)
        numberOfErrors = 0
        correctLetters = [String]()
    }
    
    private func manageCorrectGuess() {
        var wordText = ""
        var wordComplete = true
        
        for l in word.word {
            let strLetter = String(l)
            
            if correctLetters.contains(strLetter) {
                wordText += "\(strLetter) "
            } else {
                wordText += "_ "
                wordComplete = false
            }
        }
        
        secretWordLabel.text = wordText.trimmingCharacters(in: .whitespaces)
        
        if wordComplete {
            for button in keyBoardButtons {
                button.isUserInteractionEnabled = false
            }
   // setup Winning
        }
    }
    private func manageIncorrectGuess() {
        numberOfErrors += 1
        
        if numberOfErrors == 7 {
            for button in keyBoardButtons {
                button.isUserInteractionEnabled = false
            }
            // setup GameOver
        }
    }
}
