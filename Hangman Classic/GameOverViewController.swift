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
    
    var result: String!
    var detail: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gameResultLabel.text = result
        detailsResultLabel.text = detail 
    }
}
