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
    var result: Int {
        switch operationType {
        case .addition: return firstNumber + secondNumber
        case .subtraction: return firstNumber - secondNumber
        case .multiplication: return firstNumber * secondNumber
        case .division: return firstNumber / secondNumber
        }
    }
    var expression: String {
        "\(firstNumber) \(operationType.rawValue) \(secondNumber) = ?"
    }
    
    static func getRandomExpression() -> Expression {
        var firstNumber = 0
        var secondNumber = 0
        let operationTypes: [OperationType] = [
            .addition,
            .subtraction,
            .multiplication,
            .division
        ]
        let operationType = operationTypes.randomElement() ?? .addition
        
        switch operationType {
        case .addition:
            firstNumber = Int.random(in: 0...20)
            secondNumber = Int.random(in: 0...20)
        case .subtraction:
            firstNumber = Int.random(in: 0...20)
            secondNumber = Int.random(in: 0...20)
        case .multiplication:
            firstNumber = Int.random(in: 0...20)
            secondNumber = Int.random(in: 0...10)
        case .division:
            firstNumber = Int.random(in: 1...100)
            secondNumber = Int.random(in: 1...100)
            while firstNumber % secondNumber != 0 {
                secondNumber = Int.random(in: 1...100)
            }
        }
        
        return Expression(
            firstNumber: firstNumber,
            secondNumber: secondNumber,
            operationType: operationType
        )
    }
}

enum OperationType: String {
    case addition = "+"
    case subtraction = "-"
    case multiplication = "*"
    case division = "/"
}

