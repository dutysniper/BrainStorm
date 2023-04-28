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
        case .defeat(let defeat):
            gameResultLabel.text = defeat.name
            detailsResultLabel.text = defeat.details
            resultImage.image = UIImage(named: defeat.defeatImage)
        }
    }
}
