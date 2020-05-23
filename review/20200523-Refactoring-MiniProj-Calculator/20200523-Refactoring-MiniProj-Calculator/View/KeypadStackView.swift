//
//  KeypadStackView.swift
//  20200523-Refactoring-MiniProj-Calculator
//
//  Created by 천지운 on 2020/05/23.
//  Copyright © 2020 jwcheon. All rights reserved.
//

import UIKit

class KeypadStackView: UIStackView {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    convenience init(axis set: NSLayoutConstraint.Axis) {
        self.init()
        axis = set
        alignment = .fill
        distribution = .fillEqually
        spacing = 8
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
