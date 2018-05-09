//
// Created by 사명구 on 2018. 5. 9..
// Copyright (c) 2018 Learn iOS. All rights reserved.
//

import Foundation


class CalculatorBrain {

    private var accumulator: Double = 0.0

    func setOperand(operand: Double) {
        accumulator = operand
    }

    var operations: Dictionary<String, Operation> = [
        "π" : Operation.Constant(Double.pi),
        "e" : Operation.Constant(M_E),
        "√" : Operation.UnaryOperation(sqrt),
        "cos" : Operation.UnaryOperation(cos)
    ]

    enum Operation {
        case Constant(Double)
        case UnaryOperation((Double) -> Double)
        case BinaryOperation
        case Equals
    }

    func performOperation(symbol: String) {
        if let operation = operations[symbol] {
            switch operation {
            case .Constant(let value): accumulator = value
            case .UnaryOperation(let function): accumulator = function(accumulator)
            case .BinaryOperation: break
            case .Equals: break
            }
        }
    }

    var result: Double {
        get {
            return accumulator
        }
    }
}