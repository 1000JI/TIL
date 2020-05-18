//
//  ViewController.swift
//  20200518-Practice-Autolayout-Code
//
//  Created by 천지운 on 2020/05/18.
//  Copyright © 2020 jwcheon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let blackView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
//        NSLayoutConstraint(
//            item: blackView,
//            attribute: .leading,
//            relatedBy: .equal,
//            toItem: nil,
//            attribute: .notAnAttribute,
//            multiplier: 1.0,
//            constant: 8
//        )
        
        blackView.translatesAutoresizingMaskIntoConstraints = false
        blackView.frame = CGRect(x: 50, y: 50, width: 50, height: 50)
        
        var constraintX: NSLayoutConstraint
        constraintX = blackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        
        var constraintY: NSLayoutConstraint
        constraintY = blackView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        
//        blackView.frame.size = CGSize(width: 200, height: 200)
        
//        constraintX.isActive = true
//        constraintY.isActive = true
        view.addSubview(blackView)
    }

}

