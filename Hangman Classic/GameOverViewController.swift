//
//  GameOverViewController.swift
//  Hangman Classic
//
//  Created by Константин Натаров on 27.04.2023.
//

import UIKit

final class GameOverViewController: UIViewController {
    @IBOutlet var gameResultLabel: UILabel!
    @IBOutlet var detailsResultLabel: UILabel!
    @IBOutlet weak var resultImage: UIImageView!
    
    @IBOutlet weak var secondButton: UIButton!
    @IBOutlet weak var firstButton: UIButton!
    var result: GameResult!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       setupUI(with: result)
    }
    
}
extension GameOverViewController {
    private func setupUI(with result: GameResult) {
        switch result {
        case .win(let win):
            gameResultLabel.text = win.name
            detailsResultLabel.text = win.details
            resultImage.image = UIImage(named: win.winImage)
            firstButton.setTitle("Main menu", for: .normal)
                            secondButton.setTitle("Play again", for: .normal)
                            firstButton.addTarget(self, action: #selector(backToMainMenu), for: .touchUpInside)
                            secondButton.addTarget(self, action: #selector(playAgain), for: .touchUpInside)
        case .defeat(let defeat):
            gameResultLabel.text = defeat.name
            detailsResultLabel.text = defeat.details
            resultImage.image = UIImage(named: defeat.defeatImage)
            firstButton.setTitle("Change difficulty", for: .normal)
                            secondButton.setTitle("Play again", for: .normal)
                            firstButton.addTarget(self, action: #selector(changeDifficulty), for: .touchUpInside)
                            secondButton.addTarget(self, action: #selector(playAgain), for: .touchUpInside)
        }
    }
    @objc func backToMainMenu() {
           if let navigationController = self.navigationController {
               navigationController.popToRootViewController(animated: true)
           }
       }
       
    @objc func changeDifficulty() {
        if let navigationController = self.navigationController {
            let difficultyVC = DifficultyHangmanViewController()
            navigationController.popToViewController(difficultyVC, animated: true)
        }
    }
       
       @objc func playAgain() {
           guard let hangmanVC = presentingViewController as? HangmanViewController else {
                   fatalError("Unexpected presenting view controller.")
               }
               
               guard let newWord = Word.randomWord(ofDifficulty: hangmanVC.word.difficulty) else {
                   fatalError("Failed to generate a new random word.")
               }
               
               hangmanVC.word = newWord
           print(hangmanVC.word.word)
               dismiss(animated: true)
       }
   }
   











