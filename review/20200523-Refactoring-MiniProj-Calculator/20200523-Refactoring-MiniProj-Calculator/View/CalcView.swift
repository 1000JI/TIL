//
//  CalcView.swift
//  20200523-Refactoring-MiniProj-Calculator
//
//  Created by 천지운 on 2020/05/23.
//  Copyright © 2020 jwcheon. All rights reserved.
//

import UIKit

class CalcView: UIView {

    // MARK: - 각종 Views
    var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Calculator"
        label.font = .boldSystemFont(ofSize: 35)
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    lazy var resultLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.font = .boldSystemFont(ofSize: 55)
        label.textAlignment = .right
        label.textColor = .white
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    let keypadGrid = [
        ["1", "2", "3", "+"],
        ["4", "5", "6", "-"],
        ["7", "8", "9", "×"],
        ["0", "AC", "=", "÷"]
    ]
    
    let keypadStackView: KeypadStackView = KeypadStackView(axis: .vertical)
    
    // MARK: Layout Setting
    private func calcViewLayout() {
        addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.widthAnchor.constraint(equalTo: widthAnchor),
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20)
        ])
        
//        addSubview(resultLabel)
//        resultLabel.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            resultLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
//            resultLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
//            resultLabel.bottomAnchor.constraint(equalTo: keypadStackView.topAnchor, constant: -15),
//        ])
//
//        addSubview(keypadStackView)
//        keypadStackView.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            keypadStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
//            keypadStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
//            keypadStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
//            keypadStackView.heightAnchor.constraint(equalToConstant: 300)
//        ])
        
        
        // keypad
        keypadGrid.forEach{
            let rowKeypad = KeypadStackView(axis: .horizontal)
            $0.forEach {
                let button = KeypadButton(title: $0)
                
                print($0)
            }
        }
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
