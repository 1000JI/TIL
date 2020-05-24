//
//  Model.swift
//  20200523-Refactoring-MiniProj-Calculator
//
//  Created by 천지운 on 2020/05/23.
//  Copyright © 2020 jwcheon. All rights reserved.
//

import Foundation

struct CalcProcess {
    
    // MARK: 부호 구분자(계산식)
    private enum Operator: String {
        case plus   = "+"
        case minus  = "-"
        case multi  = "×"
        case div    = "÷"
        
        var calculator: (Double, Double) -> Double {
            switch self {
            case .plus  : return (+)
            case .minus : return (-)
            case .multi : return (*)
            case .div   : return (/)
            }
        }
    }
    
    // MARK: 계산 Model에 사용할 변수
    private var isTextReset     : Bool = false
    private var bufferOperator  : Operator?
    private var accumulator     : Double = 0.0
    
    // MARK: 입력 받았을 경우 실행하는 메소드
    mutating func performCommand(_ command: Command, with displayText: String) -> String {
        var resultValue: Double?
        switch command {
        case .addDigit(let value):
            return addDigit(value: value, to: displayText)
        case .operation(let operation):
            let hasChangedOp = bufferOperator != nil && isTextReset
            let accu = hasChangedOp ? accumulator : calulateMethod(with: displayText)
            resultValue = hasChangedOp ? Double(displayText) : accu
            changeState(accumulator: accu, op: Operator(rawValue: operation))
        case .equal:
            resultValue = calulateMethod(with: displayText)
            fallthrough
        case .clear:
            changeState(accumulator: 0)
        }
        isTextReset = true
        return String(resultValue ?? 0)
    }
    
    // MARK: 숫자를 입력 받았을 경우
    private mutating func addDigit(value newValue: String, to oldValue: String) -> String {
        let resultValue = isTextReset ?
            newValue : oldValue.count >= 13 ?
                oldValue : oldValue + newValue
        isTextReset = false
        return resultValue
    }
    
    // MARK: 계산해주는 메소드
    private func calulateMethod(with newValue: String) -> Double {
        let operand = Double(newValue) ?? 0
        return bufferOperator?.calculator(accumulator, operand) ?? operand
    }
    
    // MARK: Clear 메소드
    private mutating func changeState(accumulator: Double, op: Operator? = nil) {
        self.accumulator = accumulator
        bufferOperator = op
    }
    
}
