//
//  GameOverViewController.swift
//  Hangman Classic
//
//  Created by Константин Натаров on 27.04.2023.
//

import UIKit

final class GameOverViewController: UIViewController {
    
    var result: String! // <--------------------- ТУТ
    var detail: String! // <--------------------- ТУТ
    
    @IBOutlet var gameResultLabel: UILabel! // <- НЕ ТУТ
    @IBOutlet var detailsResultLabel: UILabel! // <- НЕ ТУТ
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gameResultLabel.text = result // <--------------------- ТУТ
        detailsResultLabel.text = detail // <--------------------- ТУТ
    }
}
