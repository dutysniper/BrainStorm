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
    
    var word: Word?
    override func viewDidLoad() {
        super.viewDidLoad()
        secretWordLabel.text = word?.word
        difficultyLabel.text = "Сложность: \(word?.difficulty.rawValue ?? "")"
    }
    @IBAction private func keyBoardButtonPressed(_ sender: UIButton) {
    }
}
