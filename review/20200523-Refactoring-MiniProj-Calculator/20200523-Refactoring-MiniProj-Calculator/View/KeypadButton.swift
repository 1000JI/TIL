//
//  keypadButton.swift
//  20200523-Refactoring-MiniProj-Calculator
//
//  Created by 천지운 on 2020/05/23.
//  Copyright © 2020 jwcheon. All rights reserved.
//

import UIKit

class KeypadButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    convenience init(title: String) {
        self.init()
        
        setTitle(title, for: .normal)
        setTitleColor(.white, for: .normal)
        titleLabel?.font = .boldSystemFont(ofSize: 40)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layer.cornerRadius = frame.size.width / 2
        
        if Int(currentTitle ?? "") != nil {
            backgroundColor = .darkGray
        } else if currentTitle == "AC" {
            backgroundColor = .gray
        } else {
            backgroundColor = .orange
        }
    }
}
