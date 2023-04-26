//
//  DifficultyHangmanViewController.swift
//  Hangman Classic
//
//  Created by Константин Натаров on 26.04.2023.
//

import UIKit

final class DifficultyHangmanViewController: UIViewController {
    
    var gameDescription: GameDescription!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let hangmanVC = segue.destination as? HangmanViewController else { return }
        guard let button = sender as? UIButton else { return }
        let tag = button.tag 
        let randomWord = Word.randomWord(ofDifficulty: Difficulty.allCases[tag])
        hangmanVC.word = randomWord
    }
    
    // MARK: - Navigation
    @IBAction func difficultyButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "showHangmanVC", sender: sender)
    
    }
}
