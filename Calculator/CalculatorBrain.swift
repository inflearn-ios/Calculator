//
// Created by 사명구 on 2018. 5. 9..
// Copyright (c) 2018 Learn iOS. All rights reserved.
//

import Foundation


func multiply(op1: Double, op2: Double) -> Double {
    return op1 * op2
}

class CalculatorBrain {

    private var accumulator: Double = 0.0

    var result: Double {
        get {
            return accumulator
        }
    }


    func setOperand(operand: Double) {
        accumulator = operand
    }


    private enum Operation {
        case Constant(Double)
        case UnaryOperation((Double) -> Double)
        case BinaryOperation((Double, Double) -> Double)
        case Equals
    }

    private var pending: PendingBinaryOperationInfo

    private struct PendingBinaryOperationInfo {
        var binaryOperation: (Double, Double) -> Double
        var firstOperand: Double
    }

    private var operations: Dictionary<String, Operation> = [
        "π": Operation.Constant(Double.pi),
        "e": Operation.Constant(M_E),
        "√": Operation.UnaryOperation(sqrt),
        "cos": Operation.UnaryOperation(cos),
        "×": Operation.BinaryOperation(multiply),
        "=": Operation.Equals
    ]

    func performOperation(symbol: String) {
        if let operation = operations[symbol] {
            switch operation {
            case .Constant(let value): accumulator = value
            case .UnaryOperation(let function): accumulator = function(accumulator)
            case .BinaryOperation(let function): pending = PendingBinaryOperationInfo(
                    binaryOperation: function, firstOperand: accumulator)
            case .Equals: break
            }
        }
    }

}