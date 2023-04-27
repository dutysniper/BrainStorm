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
                rule:
                """
                Тебе нужно правильно выбрать флаг, относящийся к указанной стране.
                
                Выбери континент на странице настроек.
                
                Нажми кнопку "Играть".
                
                Тебе будут даны 5 жизней. За каждую ошибку будет отниматься одна жизнь.
                
                Внизу под жизнями есть полоса восстановления.
                За каждый правильный ответ восстановление будет расти, а как только полоса дойдет до конца, прибавится одна жизнь.
                Чтобы восстановить жизнь, тебе нужно правильно ответить 5 раз подряд.
                
                По центру экрана тебе будет отображаться текущее количество правильных ответов.
                
                Как только твои жизни закончатся, ты увидишь свой результат и количство ошибок.
                
                Вернувшись на экран настроек, обязательно посети страницу со списком стран и флагов по кнопке "Учить страны" для подготовки к следующей игре и соревнованиям с друзьями.
                
                Мы постарались добавить в игру максимальное количество стран и флагов для тебя, поэтому сложность гарантирована!
                
                Давай скорее играть!
                """,
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
