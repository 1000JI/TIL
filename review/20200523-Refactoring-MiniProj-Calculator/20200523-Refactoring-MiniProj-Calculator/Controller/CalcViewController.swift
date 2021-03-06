//
//  CalcViewController.swift
//  20200523-Refactoring-MiniProj-Calculator
//
//  Created by 천지운 on 2020/05/23.
//  Copyright © 2020 jwcheon. All rights reserved.
//

import UIKit

class CalcViewController: UIViewController {

    // MARK: - 필요한 변수들 선언
    // 계산기 구조를 가지고 있는 View
    private let calcView = CalcView()
    private var calcProcess = CalcProcess()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        calcViewLayoutSetting()
        calcViewDelegateSetting()
    }
    
    private func calcViewLayoutSetting() {
        view.backgroundColor = .black
        view.addSubview(calcView)
        calcView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            calcView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            calcView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            calcView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0),
            calcView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0)
        ])
    }
}

extension CalcViewController: CalcViewDelegate {
    private func calcViewDelegateSetting() {
        calcView.delegate = self
    }
    
    func deliverSelectButtonText(_ titleText: String) {
        var command: Command
        
        switch titleText {
        case "+", "-", "×", "÷": command = .operation(titleText)
        case "=": command = .equal
        case "AC": command = .clear
        default: command = .addDigit(titleText)
        }
        
        let peelText = peelTargetText(to: calcView.resultValue)
        let returnText = calcProcess.performCommand(command, with: peelText)
        let displayText = displayTextFomatter(returnText)
        calcView.resultValue = displayText
        
        let padStr = "\(command)".padding(toLength: 14, withPad: " ", startingAt: 0)
        print("command: \(padStr) / display: \(displayText)")
    }
    
    private func displayTextFomatter(_ targetText: String) -> String {
        guard let number = Double(targetText) else { return "0" }
        let formatter = NumberFormatter()
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 3
        formatter.numberStyle = .decimal
        
        return formatter.string(from: number as NSNumber) ?? "0"
    }
    
    private func peelTargetText(to targetText: String) -> String {
        return targetText.replacingOccurrences(of: ",", with: "")
    }
}
