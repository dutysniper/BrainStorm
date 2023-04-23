//
//  ViewController.swift
//  Hangman Classic
//
//  Created by Константин Натаров on 23.04.2023.
//

import UIKit

//@IBDesignable
final class ViewController: UIViewController {
    
    private let shapesView = HumanView()

    
    @IBOutlet var humanView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        shapesView.backgroundColor = .clear
        humanView.backgroundColor = .clear
        
        shapesView.translatesAutoresizingMaskIntoConstraints = false
        
        humanView.addSubview(shapesView)
        
       // shapesView.animateCircle()
        
        NSLayoutConstraint.activate([
            shapesView.topAnchor.constraint(equalTo: humanView.topAnchor),
            shapesView.leadingAnchor.constraint(equalTo: humanView.leadingAnchor),
            shapesView.trailingAnchor.constraint(equalTo: humanView.trailingAnchor),
            shapesView.bottomAnchor.constraint(equalTo: humanView.bottomAnchor),
        ])
    }
}



