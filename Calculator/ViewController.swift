//
//  ViewController.swift
//  Calculator
//
//  Created by 사명구 on 2018. 5. 8..
//  Copyright © 2018 Learn iOS. All rights reserved.
//

import UIKit

/*
To Do
1. .으로 시작하는 경우 0.으로 변환
2. ..으로 입력할 경우 두번째 .은 무시한다.
3. 00으로 입력할 경우 두번째 0은 무시한다.
4. 이미 0.000.00 같은 경우는 .을 무시한다.


5. display.text는 항상 double형태를 유지해야 한다.
*/


class ViewController: UIViewController {

    @IBOutlet private weak var display: UILabel!

    // Computed Property
    private var displayValue: Double {
        get {
            return Double(display.text!)!
        }
        set {
            display.text = String(newValue)
        }
    }

    private var userIsInTheMiddleOfTyping = false
    private var brain = CalculatorBrain()


    @IBAction private func touchDigit(_ sender: UIButton) {
        let digit = sender.currentTitle!
        if userIsInTheMiddleOfTyping {
            let textCurrentlyInDisplay = display.text!
            if textCurrentlyInDisplay == "0" && digit == "0" {
                return
            }
            if textCurrentlyInDisplay == "." && digit == "." {
                return
            }
            if textCurrentlyInDisplay.contains(".") && digit == "."{
                return
            }
            display.text = textCurrentlyInDisplay + digit
        } else {
            display.text = digit
            if display.text == "." {
                display.text = "0."
            }
        }
        userIsInTheMiddleOfTyping = true
    }


    @IBAction private func performOperation(_ sender: UIButton) {
        if userIsInTheMiddleOfTyping {
            brain.setOperand(operand: displayValue)
            userIsInTheMiddleOfTyping = false
        }
        userIsInTheMiddleOfTyping = false
        if let mathematicalSymbol = sender.currentTitle {
            brain.performOperation(symbol: mathematicalSymbol)
        }
        displayValue = brain.result
    }
}
