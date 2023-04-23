//
//  ViewController.swift
//  Hangman Classic
//
//  Created by Константин Натаров on 23.04.2023.
//

import UIKit

// hbjbvkjnl
final class ViewController: UIViewController {
    
    private let shapesView = HumanView()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        shapesView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(shapesView)
        
       // shapesView.animateCircle()
        
        NSLayoutConstraint.activate([
            shapesView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            shapesView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            shapesView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            shapesView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -150),
        ])
    }
}



