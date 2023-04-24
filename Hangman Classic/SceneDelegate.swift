//
//  SceneDelegate.swift
//  Hangman Classic
//
//  Created by Константин Натаров on 23.04.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let _ = (scene as? UIWindowScene) else { return }
        
        // Это задает светлую тему на все приложение
        window?.overrideUserInterfaceStyle = .light
        
    }
}
