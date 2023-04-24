//
//  ViewController.swift
//  Hangman Classic
//
//  Created by Константин Натаров on 23.04.2023.
//

import UIKit

final class ViewController: UIViewController {

    @IBOutlet private var keyBoardButtons: [UIButton]!


    private let shapesView = HumanView()


    @IBOutlet private var humanView: UIView!

    override func viewDidLayoutSubviews() {
        keyBoardButtons.forEach { button in
            button.layer.cornerRadius = button.frame.height / 2
        }
    }


    override func viewDidLoad() {
        super.viewDidLoad()

        shapesView.animateCircle()
        shapesView.translatesAutoresizingMaskIntoConstraints = false
        humanView.addSubview(shapesView)


        NSLayoutConstraint.activate([
            shapesView.topAnchor.constraint(equalTo: humanView.topAnchor),
            shapesView.leadingAnchor.constraint(equalTo: humanView.leadingAnchor),
            shapesView.trailingAnchor.constraint(equalTo: humanView.trailingAnchor),
            shapesView.bottomAnchor.constraint(equalTo: humanView.bottomAnchor)
        ])
 
        

    }

    @IBAction private func keyBoardButtonPressed(_ sender: UIButton) {
        sender.isEnabled = false
        sender.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.07267296393)
        sender.layer.borderWidth = 3
        sender.layer.borderColor = [UIColor.red.cgColor, UIColor.green.cgColor].randomElement()

        UIView.animate(withDuration: 0.3, animations: {
                sender.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
            }) { _ in
                UIView.animate(withDuration: 0.5) {
                    sender.transform = CGAffineTransform.identity
                }
            }

        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
            UIButton.animate(withDuration: 0.5, animations: {
                sender.alpha = 0.0
            })
        }
    }
}



