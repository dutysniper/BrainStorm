//
//  DifficultyHangmanViewController.swift
//  Hangman Classic
//
//  Created by Константин Натаров on 26.04.2023.
//

import UIKit

final class DifficultyHangmanViewController: UIViewController {
    
    var gameDescription: GameDescription!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let hangmanVC = segue.destination as? HangmanViewController else { return }
        guard let button = sender as? UIButton else { return }
        hangmanVC.delegate = self
        let tag = button.tag 
        let randomWord = HangmanGame.randomWord(ofDifficulty: Difficulty.allCases[tag])
        hangmanVC.game = randomWord
    }
    
    // MARK: - Navigation
    @IBAction func difficultyButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "showHangmanVC", sender: sender)
    
    }
}
extension DifficultyHangmanViewController {
    private func setupBarButtonItem() {
        // Create a flexible space bar button item
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)

        // Create a bar button item
        let myButtonItem = UIBarButtonItem(title: "My Button", style: .plain, target: self, action: #selector(myButtonTapped))

        // Set the toolbar items
        var items = toolbarItems ?? []
        items += [flexibleSpace, myButtonItem]
        toolbarItems = items

        // Set the position of the toolbar to top
        navigationController?.setToolbarHidden(false, animated: false)
        navigationController?.toolbar.isTranslucent = false
        navigationController?.toolbar.barTintColor = .white
        navigationController?.toolbar.setBackgroundImage(UIImage(), forToolbarPosition: .any, barMetrics: .default)
        navigationController?.toolbar.setShadowImage(nil, forToolbarPosition: .any)

        // Move the button to the right
        navigationController?.toolbar.layoutIfNeeded()
        if let myButtonIndex = items.firstIndex(of: myButtonItem) {
            let flexibleSpaceIndex = myButtonIndex - 1
            if flexibleSpaceIndex >= 0 {
                let flexibleSpace = items[flexibleSpaceIndex]
                items.remove(at: flexibleSpaceIndex)
                items.append(flexibleSpace)
                toolbarItems = items
            }
        }

    }
    @objc func myButtonTapped() {
        let alert = UIAlertController(title: "My Alert", message: "This is an example alert", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
}

extension DifficultyHangmanViewController: HangmanViewControllerDelegate {
    func gameIsOver() {
        navigationController?.popToRootViewController(animated: true)
    }
    
    
}
