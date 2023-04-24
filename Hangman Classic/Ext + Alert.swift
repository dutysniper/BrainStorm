//
//  Ext + Alert.swift
//  Hangman Classic
//
//  Created by M I C H A E L on 25.04.2023.
//

import UIKit

// MARK: - Alert Extension
extension UIViewController {
    func showAlert(title: String, message: String, handler: @escaping () -> Void) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .actionSheet)
        let okAction = UIAlertAction(title: "Да", style: .default) { _ in
            handler()
        }
        let denyAction = UIAlertAction(title: "Нет", style: .destructive)
        
        alert.addAction(okAction)
        alert.addAction(denyAction)
        present(alert, animated: true)
    }
}
