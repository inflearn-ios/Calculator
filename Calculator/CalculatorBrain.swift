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

    var operations: Dictionary<String, Double> = [
        "π" : Double.pi,
        "e" : M_E
    ]
    func performOperation(symbol: String) {
        if let constant = operations[symbol] {
            accumulator = constant
        }
    }

    var result: Double {
        get {
            return accumulator
        }
    }
}