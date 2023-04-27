//
//  Word.swift
//  Hangman Classic
//
//  Created by Константин Натаров on 24.04.2023.
//

struct Word {
    let word: String
    let difficulty: Difficulty
    var gameProgress: [GameProgress]
    var gameResult: [GameResult]
    
    init(
        word: String,
        difficulty: Difficulty,
        gameProgress: [GameProgress],
        gameResult: [GameResult]
    ) {
        self.word = word
        self.difficulty = difficulty
        self.gameProgress = gameProgress
        self.gameResult = gameResult
    }
}

enum Difficulty: String, CaseIterable {
    case easy
    case medium
    case hard
    case impossible
}

enum GameProgress: String, CaseIterable {
    case one = "hangman1"
    case two = "hangman2"
    case three = "hangman3"
    case four = "hangman4"
    case five = "hangman5"
    case six = "hangman6"
    case seven = "hangman7"
}

enum GameResult: String, CaseIterable {
    case win = "Вас не остановить! Вы успешно угадали слово и остановили палача"
    case defeat = "На этот раз удача отвернулась от вас. Понизим сложность?"
}

extension Word {
    static func randomWord(ofDifficulty difficulty: Difficulty) -> Word? {
        let wordArray: [String]
        let dataStore = HangmanDataStore.shared
        switch difficulty {
        case .easy:
            wordArray = dataStore.easyWords
        case .medium:
            wordArray = dataStore.mediumWords
        case .hard:
            wordArray = dataStore.hardWords
        case .impossible:
            wordArray = dataStore.impossibleWords
        }
        
        guard let randomWord = wordArray.randomElement() else {
            return nil
        }
        
        return Word(word: randomWord.lowercased(), difficulty: difficulty, gameProgress: GameProgress.allCases, gameResult: GameResult.allCases)
    }
}
