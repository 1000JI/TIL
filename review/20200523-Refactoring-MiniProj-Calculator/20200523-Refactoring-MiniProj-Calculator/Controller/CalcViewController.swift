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
    let calcView: UIView = CalcView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        calcViewLayoutSetting()
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
