//
//  MathExpression.swift
//  Hangman Classic
//
//  Created by Степан Фоминцев on 25.04.2023.
//

struct Expression {
    let firstNumber: Int
    let secondNumber: Int
    let operationType: OperationType
    let expressionType: ExpressionType
    
    var result: Int {
        get {
            switch operationType {
            case .addition: return firstNumber + secondNumber
            case .subtraction: return firstNumber - secondNumber
            case .multiplication: return firstNumber * secondNumber
            case .division: return firstNumber / secondNumber
            }
        }
    }
    var expression: String {
        switch expressionType {
        case .operand: return "\(firstNumber) \(operationType.rawValue) ?  = \(result)"
        case .operationType: return "\(firstNumber) ? \(secondNumber) = \(result)"
        case .result: return "\(firstNumber) \(operationType.rawValue) \(secondNumber) = ?"
        }
    }
    var fullExpression: String {
        "\(firstNumber) \(operationType.rawValue) \(secondNumber) = \(result)"
    }
    
    static func getRandomExpression(withDifficulty difficulty: Int) -> Expression {
        var firstNumber = 0
        var secondNumber = 0
        let operationTypes: [OperationType] = [
            .addition,
            .subtraction,
            .multiplication,
            .division
        ]
        let expressionTypes: [ExpressionType] = [
            .operand,
            .operationType,
            .result
        ]
        let operationType = operationTypes.randomElement() ?? .addition
        let expressionType = expressionTypes.randomElement() ?? .operationType
        
        switch operationType {
        case .addition:
            firstNumber = Int.random(in: 1 * difficulty...40 * difficulty)
            secondNumber = Int.random(in: 1 * difficulty...40 * difficulty)
        case .subtraction:
            firstNumber = Int.random(in: 1 * difficulty...40 * difficulty)
            secondNumber = Int.random(in: 1 * difficulty...40 * difficulty)
        case .multiplication:
            firstNumber = Int.random(in: 1 * difficulty...5 * difficulty)
            secondNumber = Int.random(in: 1 * difficulty...5 * difficulty)
        case .division:
            firstNumber = Int.random(in: 1 * difficulty...50 * difficulty)
            secondNumber = Int.random(in: 1 * difficulty...10 * difficulty)
            while isPrimeNumber(number: firstNumber) || firstNumber < 8 {
                firstNumber = Int.random(in: 1 * difficulty...50 * difficulty)
            }
            while firstNumber % secondNumber != 0 || secondNumber == 1 || firstNumber == secondNumber {
                secondNumber = Int.random(in: 1...firstNumber)
            }
        }
        
        func isPrimeNumber(number: Int) -> Bool {
            number % 2 == 0 || number % 3 == 0 || number % 5 == 0 || number % 7 == 0 ? false : true
        }
        
        return Expression(
            firstNumber: firstNumber,
            secondNumber: secondNumber,
            operationType: operationType,
            expressionType: expressionType
        )
    }
}

enum OperationType: String, CaseIterable {
    case addition = "+"
    case subtraction = "-"
    case multiplication = "*"
    case division = "/"
}

enum ExpressionType {
    case operand
    case operationType
    case result
}

struct MathGame {
    let name: String
    let description: String
    let image: String
    
    static func getGames() -> [MathGame] {
        [
            MathGame(name: "Спринт", description: "10 секунд на правильный ответ", image: "timeGame"),
            MathGame(name: "Да или нет", description: "Определите верное ли выражение", image: "yesOrNoGame")
        ]
    }
}
