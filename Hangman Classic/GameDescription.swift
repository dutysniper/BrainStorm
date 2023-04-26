//
//  GameDescription.swift
//  Hangman Classic
//
//  Created by M I C H A E L on 27.04.2023.
//

enum GameName: String {
    case hangman = "Виселица"
    case flag = "Страны & Флаги"
    case math = "Математика"
}

struct GameDescription {
    let game: GameName
    let gamePhoto: String
    let description: String
    let rule: String
    let segueID: String
}

extension GameDescription {
    static func getInfo() -> [GameDescription] {
        [
            GameDescription(
                game: .hangman,
                gamePhoto: "Hangman",
                description: "Успей угадать слово, пока петля не затянулась!",
                rule: "",
                segueID: "showHangman"
            ),
            GameDescription(
                game: .flag,
                gamePhoto: "Flag",
                description: "Сопоставь флаг со страной, если сможешь!",
                rule: "",
                segueID: "showFlag"
            ),
            GameDescription(
                game: .math,
                gamePhoto: "Math",
                description:
                """
                Окунись в мир быстрой математики и покажи свой лучший результат!
                """,
                rule: "",
                segueID: "showMath"
            )
        ]
    }
}
