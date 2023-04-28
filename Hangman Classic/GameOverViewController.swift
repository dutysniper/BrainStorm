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
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        if isBeingDismissed || isMovingFromParent {
            print("GameOverViewController is dismissing")
        }
    }
}
extension GameOverViewController {
    private func setupUI(with result: GameResult) {
        switch result {
        case .win(let win):
            gameResultLabel.text = win.name
            detailsResultLabel.text = win.details
            resultImage.image = UIImage(named: win.winImage)
            firstButton.setTitle("Выход", for: .normal)
                            secondButton.setTitle("Новое слово", for: .normal)
                            firstButton.addTarget(self, action: #selector(backToMainMenu), for: .touchUpInside)
                            secondButton.addTarget(self, action: #selector(playAgain), for: .touchUpInside)
        case .defeat(let defeat):
            gameResultLabel.text = defeat.name
            detailsResultLabel.text = defeat.details
            resultImage.image = UIImage(named: defeat.defeatImage)
            firstButton.setTitle("Сменить сложность", for: .normal)
                            secondButton.setTitle("Новое слово", for: .normal)
                            firstButton.addTarget(self, action: #selector(changeDifficulty), for: .touchUpInside)
                            secondButton.addTarget(self, action: #selector(playAgain), for: .touchUpInside)
        }
    }
    @objc func backToMainMenu() {
        if let viewControllers = navigationController?.viewControllers {
                let filteredVCs = viewControllers.filter { !($0 is HangmanViewController) }
                navigationController?.setViewControllers(filteredVCs, animated: false)
                let difficultyVC = DifficultyHangmanViewController()
                navigationController?.pushViewController(difficultyVC, animated: true)
            }
       }
       
    @objc func changeDifficulty() {
        if let viewControllers = navigationController?.viewControllers {
                let filteredVCs = viewControllers.filter { !($0 is HangmanViewController) }
                navigationController?.setViewControllers(filteredVCs, animated: false)
                let difficultyVC = DifficultyHangmanViewController()
                navigationController?.pushViewController(difficultyVC, animated: true)
            }
    }
       
       @objc func playAgain() {
           guard let hangmanVC = presentingViewController as? HangmanViewController else {
                   fatalError("Unexpected presenting view controller.")
               }
               
               guard let newWord = HangmanGame.randomWord(ofDifficulty: hangmanVC.game.difficulty) else {
                   fatalError("Failed to generate a new random word.")
               }
               
               hangmanVC.game = newWord
           print(hangmanVC.game.word)
               dismiss(animated: true)
       }
   }
   











