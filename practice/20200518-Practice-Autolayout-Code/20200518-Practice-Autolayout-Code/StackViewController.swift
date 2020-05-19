//
//  StackViewController.swift
//  20200518-Practice-Autolayout-Code
//
//  Created by 천지운 on 2020/05/18.
//  Copyright © 2020 jwcheon. All rights reserved.
//

import UIKit

class StackViewController: UIViewController {

    var stackView: UIStackView = UIStackView()
    
    let redView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }()
    
    let blueView: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        return view
    }()
    
    let yellowView: UIView = {
        let view = UIView()
        view.backgroundColor = .yellow
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setLayout()
    }
    
    private func setLayout() {
        view.addSubview(stackView)
        
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.spacing = 8
        
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50).isActive = true
        stackView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        
        stackView.addArrangedSubview(redView)
        stackView.addArrangedSubview(blueView)
        stackView.addArrangedSubview(yellowView)
        
//        stackView.arrangedSubviews.forEach{ $0.translatesAutoresizingMaskIntoConstraints = false }
//        stackView.arrangedSubviews[0].widthAnchor.constraint(equalToConstant: 30).isActive = true
//        stackView.arrangedSubviews[0].heightAnchor.constraint(equalToConstant: 30).isActive = true
        
    }
}
