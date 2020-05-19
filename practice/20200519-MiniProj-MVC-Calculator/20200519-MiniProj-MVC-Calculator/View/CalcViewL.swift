//
//  ViewController.swift
//  20200519-MiniProj-MVC-Calculator
//
//  Created by 천지운 on 2020/05/19.
//  Copyright © 2020 jwcheon. All rights reserved.
//

import UIKit

class MyButton: UIButton {
    override func updateConstraints() {
        super.updateConstraints()
//        print(#function)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
//        print(#function)
    }
}

protocol CalcViewDelegate: class {
    func addTargetSetting(_ button: UIButton)
}

class CalcView: UIView {
    
    var delegate: CalcViewDelegate?

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layoutSetting()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Layout Setting
    private func layoutSetting() {
        self.backgroundColor = .darkGray
        
        // titleLabel Layout
        self.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0)
        ])
        
        // keypadStackView Layout
        keypadStackView.axis = .vertical
        keypadStackView.alignment = .fill
        keypadStackView.distribution = .fillEqually
        keypadStackView.spacing = 8
        
        var stackView = createLineStackView()
        
        for rowKeypad in keypadGrid {
            for title in rowKeypad {
                let button = MyButton(type: .system)
                button.setTitle("\(title)", for: .normal)
                button.setTitleColor(.white, for: .normal)
                
                if Int(title) != nil {
                    button.backgroundColor = .systemGray
                } else {
                    if title == "AC" {
                        button.backgroundColor = .systemGray3
                    } else {
                        button.backgroundColor = .systemOrange
                    }
                }
                button.titleLabel?.font = .boldSystemFont(ofSize: 40)
                delegate?.addTargetSetting(button)
                
                button.translatesAutoresizingMaskIntoConstraints = false
                button.widthAnchor.constraint(equalTo: button.heightAnchor, multiplier: 1).isActive = true
                
                stackView.addArrangedSubview(button)
            }
            keypadStackView.addArrangedSubview(stackView)
            stackView = createLineStackView()
        }
        
        self.addSubview(keypadStackView)
        keypadStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            keypadStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
            keypadStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8),
            keypadStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8)
        ])
        
        // resultLabel Layout
        self.addSubview(resultLabel)
        resultLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            resultLabel.bottomAnchor.constraint(equalTo: keypadStackView.topAnchor, constant: -10),
            resultLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            resultLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            resultLabel.topAnchor.constraint(greaterThanOrEqualTo: titleLabel.bottomAnchor, constant: 0)
        ])
    }
    
    func buttonLayoutSetting() {
        for rowKeyPad in keypadStackView.arrangedSubviews {
            if let rowStackView = rowKeyPad as? UIStackView {
                for button in rowStackView.arrangedSubviews {
//                    print("BUTTON FRAME :", button.frame.size.width)
                    button.layer.cornerRadius = button.frame.size.width / 2
                }
            }
        }
    }
    
    // MARK: - View 생성
    // MARK: titleLabel 생성
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Calculator"
        label.font = .boldSystemFont(ofSize: 35)
        label.textAlignment = .center
        label.textColor = .white
        label.backgroundColor = .clear
        return label
    }()

    // MARK: resultLabel
    private var resultLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.font = .boldSystemFont(ofSize: 60)
        label.textAlignment = .right
        label.textColor = .white
        label.backgroundColor = .clear
        return label
    }()
    
    // MARK: keypadStackView
    private var keypadStackView = UIStackView()
    
    // MARK: line Stack View Create method
    private func createLineStackView() -> UIStackView {
        let tempStackView = UIStackView()
        tempStackView.axis = .horizontal
        tempStackView.distribution = .fillEqually
        tempStackView.alignment = .fill
        tempStackView.spacing = 8
        return tempStackView
    }
    
    // MARK: Keypad Grid
    private let keypadGrid = [
        ["1", "2", "3", "+"],
        ["4", "5", "6", "-"],
        ["7", "8", "9", "×"],
        ["0", "AC", "=", "÷"]
    ]
}
