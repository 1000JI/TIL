//
//  CalcView.swift
//  20200523-Refactoring-MiniProj-Calculator
//
//  Created by 천지운 on 2020/05/23.
//  Copyright © 2020 jwcheon. All rights reserved.
//

import UIKit

protocol CalcViewDelegate: class {
    func deliverSelectButtonText(_ titleText: String)
}

class CalcView: UIView {
    var delegate: CalcViewDelegate?

    // MARK: - 각종 Views
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Calculator"
        label.font = .boldSystemFont(ofSize: 35)
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    var resultValue: String {
        get { return resultLabel.text ?? "" }
        set { resultLabel.text = newValue }
    }
    
    private var resultLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.font = .boldSystemFont(ofSize: 55)
        label.textAlignment = .right
        label.textColor = .white
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    private let keypadGrid = [
        ["1", "2", "3", "+"],
        ["4", "5", "6", "-"],
        ["7", "8", "9", "×"],
        ["0", "AC", "=", "÷"]
    ]
    
    private let keypadStackView: KeypadStackView = KeypadStackView(axis: .vertical)
    
    // MARK: Layout Setting
    private func calcViewLayout() {
        addSubview(titleLabel)
        addSubview(resultLabel)
        addSubview(keypadStackView)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.widthAnchor.constraint(equalTo: widthAnchor),
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            titleLabel.bottomAnchor.constraint(lessThanOrEqualTo: resultLabel.topAnchor, constant: 0)
        ])
        
        resultLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            resultLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            resultLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            resultLabel.bottomAnchor.constraint(equalTo: keypadStackView.topAnchor, constant: -15),
        ])
        
        keypadStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            keypadStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            keypadStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            keypadStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)
        ])
        
        
        keypadGrid.forEach{
            let rowKeypadStackView = KeypadStackView(axis: .horizontal)
            $0.forEach {
                let button = KeypadButton(title: $0, type: .system)
                button.addTarget(self, action: #selector(clickedButtonEvent(_:)), for: .touchUpInside)

                button.translatesAutoresizingMaskIntoConstraints = false
                NSLayoutConstraint.activate([
                    button.widthAnchor.constraint(equalTo: button.heightAnchor, multiplier: 1.0)
                ])
                rowKeypadStackView.addArrangedSubview(button)
            }
            keypadStackView.addArrangedSubview(rowKeypadStackView)
        }
    }
    
    // Button Action Seletor
    @objc private func clickedButtonEvent(_ sender: UIButton) {
        guard let selectButtonTitle = sender.currentTitle else { return }
        delegate?.deliverSelectButtonText(selectButtonTitle)
    }
    
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        calcViewLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
