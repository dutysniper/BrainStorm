//
//  FlagRulesViewController.swift
//  Hangman Classic
//
//  Created by M I C H A E L on 27.04.2023.
//

import UIKit

final class FlagRulesViewController: UIViewController {

    @IBOutlet private var rulesTextView: UITextView!
    
    var gameDescription: GameDescription!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        rulesTextView.text = gameDescription.rule
        
    }
}
