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

    func performOperation(symbol: String) {
        switch symbol {
        case "π": accumulator = Double.pi
        case "√": accumulator = sqrt(accumulator)
        default: break
        }
    }

    var result: Double {
        get {
            return accumulator
        }
    }
}