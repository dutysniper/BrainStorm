//
//  Word.swift
//  Hangman Classic
//
//  Created by Константин Натаров on 24.04.2023.
//

struct Word {
    let dataStore = HangmanDataStore.shared
    
    var word: String
    var difficulty: Difficulty
    
    
    init(word: String, difficulty: Difficulty) {
        self.word = word
        self.difficulty = difficulty
    }
    
    
}

enum Difficulty: String, CaseIterable {
    case easy
    case medium
    case hard
    case impossible
}

//extension Word {
//    static func randomWord(ofDifficulty difficulty: Difficulty) -> Word? {
//        let wordArray: [String]
//
//        switch difficulty {
//        case .easy:
//            wordArray = dataStore.easyWords
//        case .medium:
//            wordArray = dataStore.mediumWords
//        case .hard:
//            wordArray = dataStore.hardWords
//        case .impossible:
//            wordArray = dataStore.impossibleWords
//        }
        
//        guard let randomWord = wordArray.randomElement() else {
//            return nil
//        }
        
//        return Word(word: randomWord, difficulty: difficulty)
//    }
}
