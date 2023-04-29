//
//  GameOverViewController.swift
//  Hangman Classic
//
//  Created by Константин Натаров on 27.04.2023.
//

import UIKit

protocol GameOverViewControllerDelegate: AnyObject {
    func gameIsOver()
}

final class GameOverViewController: UIViewController {
    @IBOutlet var gameResultLabel: UILabel!
    @IBOutlet var detailsResultLabel: UILabel!
    @IBOutlet weak var resultImage: UIImageView!
    
    @IBOutlet weak var secondButton: UIButton!
    @IBOutlet weak var firstButton: UIButton!
    
    weak var delegate: GameOverViewControllerDelegate?
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
            firstButton.setTitle("Выход", for: .normal)
            firstButton.setImage(UIImage(named: "house.fill"), for: .normal)
            secondButton.setTitle("Новое слово", for: .normal)
            firstButton.addTarget(self, action: #selector(backToMainMenu), for: .touchUpInside)
            secondButton.addTarget(self, action: #selector(playAgain), for: .touchUpInside)
            
        case .defeat(let defeat):
            gameResultLabel.text = defeat.name
            detailsResultLabel.text = defeat.details
           
            firstButton.setTitle("Сменить сложность", for: .normal)
            secondButton.setTitle("Новое слово", for: .normal)
            firstButton.addTarget(self, action: #selector(changeDifficulty), for: .touchUpInside)
            secondButton.addTarget(self, action: #selector(playAgain), for: .touchUpInside)
            
            if (traitCollection.userInterfaceStyle == .light) {
                resultImage.image = UIImage(named: defeat.defeatImage)
            } else {
                resultImage.image = invertImageColor(defeat.defeatImage)
            }
        }
    }
    @objc func backToMainMenu() {
        customDismiss()
    }
    
    @objc func changeDifficulty() {
        customDismiss()
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

extension GameOverViewController {
    private func customDismiss() {
        dismiss(animated: true) { [weak self] in
            self?.delegate?.gameIsOver()
        }
    }
}
