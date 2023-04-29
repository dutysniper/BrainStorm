//
//  GameOverViewController.swift
//  Hangman Classic
//  Created by Константин Натаров on 27.04.2023.

import UIKit

//MARK: - GameOverViewControllerDelegate protocol
protocol GameOverViewControllerDelegate: AnyObject {
    func gameIsOver()
    func changeDifficulty()
}

final class GameOverViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet private var gameResultLabel: UILabel!
    @IBOutlet private var detailsResultLabel: UILabel!
    @IBOutlet private var wordLabel: UILabel!
    
    @IBOutlet private var resultImage: UIImageView!
    
    @IBOutlet private var secondButton: UIButton!
    @IBOutlet private var firstButton: UIButton!
    
    //MARK: - Class properties
    weak var delegate: GameOverViewControllerDelegate?
    var result: GameResult!
    var word: String?
    
    //MARK: - Life-cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI(with: result)
    }
}

//MARK: - Setup UI
extension GameOverViewController {
    private func setupUI(with result: GameResult) {
        switch result {
        case .win(let name, let details, let winImage):
            gameResultLabel.text = name
            detailsResultLabel.text = details
            resultImage.image = UIImage(named: winImage)
            firstButton.setTitle("Выход", for: .normal)
            firstButton.setImage(UIImage(named: "house.fill"), for: .normal)
            secondButton.setTitle("Новое слово", for: .normal)
            firstButton.addTarget(self, action: #selector(backToMainMenu), for: .touchUpInside)
            secondButton.addTarget(self, action: #selector(playAgain), for: .touchUpInside)
            
        case .defeat(let name, let details, let defeatImage):
            gameResultLabel.text = name
            detailsResultLabel.text = details
            wordLabel.isHidden = false
            wordLabel.text = "Слово: \(word ?? "")"
            
            firstButton.setTitle("Сменить сложность", for: .normal)
            secondButton.setTitle("Новое слово", for: .normal)
            
            firstButton.addTarget(self, action: #selector(changeDifficulty), for: .touchUpInside)
            secondButton.addTarget(self, action: #selector(playAgain), for: .touchUpInside)
            
            if (traitCollection.userInterfaceStyle == .light) {
                resultImage.image = UIImage(named: defeatImage)
            } else {
                resultImage.image = invertImageColor(defeatImage)
            }
        }
    }
    
    //MARK: - Setup buttons logic
    @objc private func backToMainMenu() {
        dismiss(animated: true) { [weak self] in
            self?.delegate?.gameIsOver()
        }
    }
    
    @objc private func changeDifficulty() {
        dismiss(animated: true) { [weak self] in
            self?.delegate?.changeDifficulty()
        }
    }
    
    @objc private func playAgain() {
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

