//
//  CalcModel.swift
//  20200519-MiniProj-MVC-Calculator
//
//  Created by 천지운 on 2020/05/19.
//  Copyright © 2020 jwcheon. All rights reserved.
//

import Foundation

class CalcClass {
    private var isNumberTyping  : Bool = false // true: 숫자 입력 중, false: 부호, 등호 입력
    private var isInputMode     : Bool = true  // true: 첫번째 수, false: 두번째 수
    private var isNativeNumber  : Bool = false // true: 음수, false: 양수
    private var isResultPrint   : Bool = false // true: 출력 후, flase: 출력 전
    
    private var firstNumber     : String = ""
    private var secondNumber    : String = ""
    private var signOperator    : String = ""
    
    // MARK: - VC에서 받은 값을 처리하는 메소드
    func calcProcess(_ inputValue: String) -> String {
        switch inputValue {
        case "+", "-", "×", "÷":
            return inputSign(inputValue)
        case "=":
            return inputEqual()
        case "AC":
            return calcInit()
        default:
            return inputNumber(inputValue)
        }
    }
    
    // MARK: 등호를 입력 했을 경우
    private func inputEqual() -> String {
        if isInputMode {
            isResultPrint = true
            if isNativeNumber {
                firstNumber = "-" + firstNumber
                isNativeNumber = !isNativeNumber
                return firstNumber
            } else {
                return ""
            }
        } else if isResultPrint { return "" }
        
        if secondNumber.isEmpty { secondNumber = firstNumber }
        isResultPrint = true
        firstNumber = calculatorMethod(firstNumber, secondNumber, signOperator)
        return firstNumber
    }
    
    // MARK: 계산 메소드
    private func calculatorMethod(_ leftN: String, _ rightN: String, _ operatorValue: String) -> String {
        secondNumber = ""
        switch operatorValue {
        case "+":
            return "\(Double(leftN)! + Double(rightN)!)"
        case "-":
            return "\(Double(leftN)! - Double(rightN)!)"
        case "×":
            return "\(Double(leftN)! * Double(rightN)!)"
        case "÷":
            return "\(Double(leftN)! / Double(rightN)!)"
        default:
            return ""
        }
    }
    
    // MARK: 부호를 입력 했을 경우
    private func inputSign(_ sign: String) -> String {
        isResultPrint = false
        
        if !isNumberTyping && isInputMode && sign == "-" {
            isNativeNumber = !isNativeNumber
            return ""
        }
        
        if isNumberTyping {
            if !secondNumber.isEmpty {
                firstNumber = calculatorMethod(firstNumber, secondNumber, signOperator)
            }
            isInputMode = false
            isNumberTyping = false
        }
        signOperator = sign
        
        if isNativeNumber {
            firstNumber = "-" + firstNumber
            isNativeNumber = !isNativeNumber
        }
        return firstNumber
    }
    
    // MARK: 숫자를 입력 했을 경우
    private func inputNumber(_ number: String) -> String {
        if isResultPrint { _ = calcInit() }
        isNumberTyping = true

        if isInputMode {
            guard firstNumber.count < 13 else { return firstNumber }
            firstNumber.append(number)
            return firstNumber
        } else {
            guard secondNumber.count < 13 else { return secondNumber }
            secondNumber.append(number)
            return secondNumber
        }
    }
    
    // MARK: 초기화
    private func calcInit() -> String {
        isNumberTyping   = false
        isInputMode      = true
        isNativeNumber   = false
        isResultPrint    = false
        
        firstNumber      = ""
        secondNumber     = ""
        signOperator     = ""
        return "0"
    }
}
