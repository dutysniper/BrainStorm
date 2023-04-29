//
//  DifficultyHangmanViewController.swift
//  Hangman Classic
//
//  Created by Константин Натаров on 26.04.2023.
//

import UIKit

final class DifficultyHangmanViewController: UIViewController {
    
    //MARK: - Class properties
    var gameDescription: GameDescription!
    
    // MARK: - Life-cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = false
    }
    
    //MARK: - Override methods
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let hangmanVC = segue.destination as? HangmanViewController else { return }
        guard let button = sender as? UIButton else { return }
        hangmanVC.delegate = self
        let tag = button.tag 
        let randomWord = HangmanGame.randomWord(ofDifficulty: Difficulty.allCases[tag])
        hangmanVC.game = randomWord
    }
    
    // MARK: - Navigation
    @IBAction private func difficultyButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "showHangmanVC", sender: sender)
        
    }
    //MARK: - IBActions
    @IBAction private func infoButtonTapped(_ sender: UIBarButtonItem) {
        showOkAlert(title: "Правила", message: gameDescription.rule)
    }
}

//MARK: - HangmanViewControllerDelegate method
extension DifficultyHangmanViewController: HangmanViewControllerDelegate {
    func gameIsOver() {
        navigationController?.popToRootViewController(animated: true)
    }
    
    
}
