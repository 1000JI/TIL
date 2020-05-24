//
//  ReCalcProcess.swift
//  20200523-Refactoring-MiniProj-Calculator
//
//  Created by 천지운 on 2020/05/24.
//  Copyright © 2020 jwcheon. All rights reserved.
//

import Foundation

struct ReCalcProcess{
    enum CalcOperator: String {
        case plus = "+"
        case minus = "-"
        case multi = "×"
        case div = "÷"
        var calculator: (Double, Double) -> Double {
            switch self {
            case .plus: return (+)
            case .minus: return (-)
            case .multi: return (*)
            case .div: return (/)
            }
        }
    }
    
    private var accumulator      : Double = 0.0
    private var bufferOperator  : CalcOperator?
    private var isResetNumber   : Bool = true
    
    mutating func performCalculator(command: Command, with displayText: String) -> String {
        var resultValue: Double?
        switch command {
        case .addDigit(let value):
            return addDigit(in: displayText, with: value)
        case .operation(let op):
            let hasChangeOp = isResetNumber && bufferOperator != nil
            let accu = hasChangeOp ? accumulator : calculatorMethod(for: displayText)
            resultValue = hasChangeOp ? Double(displayText) : accu
            changeState(accumlator: accu, op: CalcOperator(rawValue: op))
        case .equal:
            resultValue = calculatorMethod(for: displayText)
            fallthrough
        case .clear:
            changeState(accumlator: 0)
        }
        isResetNumber = true
        return String(resultValue ?? 0)
    }
    
    private mutating func addDigit(in oldValue: String, with newValue: String) -> String {
        let resultValue = isResetNumber ? newValue :
            oldValue.count >= 13 ? oldValue : oldValue + newValue
        isResetNumber = false
        return resultValue
    }
    
    private func calculatorMethod(for value: String) -> Double {
        let operand = Double(value)!
        return bufferOperator?.calculator(accumulator, operand) ?? operand
    }
    
    private mutating func changeState(accumlator: Double, op: CalcOperator? = nil) {
        self.accumulator = accumlator
        bufferOperator = op
    }
}
