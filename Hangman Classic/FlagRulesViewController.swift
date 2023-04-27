//
//  FlagRulesViewController.swift
//  Hangman Classic
//
//  Created by M I C H A E L on 27.04.2023.
//

import UIKit

final class FlagRulesViewController: UIViewController {

    // MARK: - IB Outlets
    @IBOutlet private var rulesTextView: UITextView!
    
    // MARK: - Public Properties
    var gameDescription: GameDescription!
    
    // MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        rulesTextView.text = gameDescription.rule
    }
}
