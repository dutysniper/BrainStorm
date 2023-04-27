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
    var correctLetters = [String]()
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
        //        secretWordLabel.text = word.word.map { _ in "_" }.joined()
        difficultyLabel.text = "Сложность: \(word?.difficulty.rawValue ?? "")"
    }
    
    @IBAction private func keyBoardButtonPressed(_ sender: UIButton) {
        let letter = sender.titleLabel?.text?.lowercased() ?? " "
        print(letter)
        print("secretWord: \(secretWord)")
        if word.word.contains(letter) {
            setCorrectLetter(letter: letter)
        } else {
            numberOfErrors += 1
            hangmanImage.image = UIImage(named: word.gameProgress[numberOfErrors].rawValue)
        }
        setView(view: sender, hidden: true)
    }
}
extension HangmanViewController {
    
    private func setCorrectLetter(letter: String) {
        var _word = ""
        for i in zip(word.word, secretWord) {
            if String(i.0) == letter && String(i.1) == "_" {
                _word += letter
            } else {
                _word += String(i.1)
            }
        }
        secretWord = _word
    }
    func setView(view: UIView, hidden: Bool) {
        UIView.transition(with: view, duration: 0.5, options: .transitionCrossDissolve, animations: {
            view.isHidden = hidden
        })
    }
}


