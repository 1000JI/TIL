//
//  ReCalcViewController.swift
//  20200523-Refactoring-MiniProj-Calculator
//
//  Created by 천지운 on 2020/05/24.
//  Copyright © 2020 jwcheon. All rights reserved.
//

import UIKit

class ReCalcViewController: UIViewController {

    private let calcView = CalcView()
    private var calcProcess = ReCalcProcess()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        calcLayoutSetting()
        calcViewDelegateSetting()
    }
    
    // MARK: - CalcView Layout Setting
    private func calcLayoutSetting() {
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

// MARK: - Extension CalcViewDelegate
extension ReCalcViewController: CalcViewDelegate {
    private func calcViewDelegateSetting() {
        calcView.delegate = self
    }
    
    func deliverSelectButtonText(_ titleText: String) {
        var command: Command
        
        switch titleText {
        case "+", "-", "×", "÷":    command = .operation(titleText)
        case "=":                   command = .equal
        case "AC":                  command = .clear
        default:                    command = .addDigit(titleText)
        }
        
        let displayText = calcView.resultValue.replacingOccurrences(of: ",", with: "")
        let newStatus = calcProcess.performCalculator(command: command, with: displayText)
        calcView.resultValue = displayTextFormatter(to: newStatus)
        
        let padStr = "\(command)".padding(toLength: 14, withPad: " ", startingAt: 0)
        print("command: \(padStr) / display: \(calcView.resultValue)")
    }
    
    private func displayTextFormatter(to changedText: String) -> String {
        guard let transText = Double(changedText) else { return "0" }
        let formatter = NumberFormatter()
        formatter.maximum = 3
        formatter.minimum = 0
        formatter.numberStyle = .decimal
        return formatter.string(from: transText as NSNumber) ?? "0"
    }
}
