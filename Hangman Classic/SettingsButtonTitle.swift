//
//  SettingsButtonTitle.swift
//  Hangman Classic
//
//  Created by M I C H A E L on 28.04.2023.
//

import Foundation

struct SettingsButtonTitle {
    let header: String
    let title: [String]
    let image: [String]
}
 
extension SettingsButtonTitle {
    static func getSettingsButtonTitles() -> [SettingsButtonTitle] {
        
        var appVersion = "Не удалось получить версию приложения"
        
        let version = Bundle.main.object(
            forInfoDictionaryKey: "CFBundleShortVersionString"
        )
        
        if let version = version as? String {
            appVersion = "Version: \(version)"
        }
        
        return [
            
            SettingsButtonTitle(
                header: "Подписка",
                title: ["Оформить подписку", "Восстановить подписку"],
                image: ["cart.badge.plus.fill", "arrow.counterclockwise.icloud.fill" ]
            ),
            SettingsButtonTitle(
                header: "Обратная связь",
                title: ["Оценить в AppStore", "Написать на почту"],
                image: ["star.fill", "envelope.open.fill"]
            ),
            SettingsButtonTitle(
                header: "Тема",
                title: ["Тема"],
                image: ["envelope.open.fill"]
            ),
            SettingsButtonTitle(
                header: "Команда",
                title: ["Разработчики"],
                image: ["person.2.fill"]
            ),
            SettingsButtonTitle(
                header: " ",
                title: [appVersion],
                image: [""]
            )
        ]
    }
}
