//
//  CalcController.swift
//  20200519-MiniProj-MVC-Calculator
//
//  Created by 천지운 on 2020/05/19.
//  Copyright © 2020 jwcheon. All rights reserved.
//

import Foundation
import UIKit

class CalcController: UIViewController {
    
    private let calcView = CalcView()
    private let calcProcess = CalcClass()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        calcView.delegate = self
        controllerLayoutSetting()
    }
    
    private func controllerLayoutSetting() {
        view.backgroundColor = .darkGray
        view.addSubview(calcView)
        
        calcView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            calcView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            calcView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0),
            calcView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            calcView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0)
        ])
    }
    
    override func viewDidLayoutSubviews() {
        view.layoutIfNeeded()
        calcView.buttonLayoutSetting()
    }
}

extension CalcController: CalcViewDelegate {
    func clickedButtonEvent(_ inputText: String) -> String {
        return calcProcess.calcProcess(inputText)
    }
}
