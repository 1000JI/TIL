//
//  ViewController.swift
//  20200518-Practice-Autolayout-Code
//
//  Created by 천지운 on 2020/05/18.
//  Copyright © 2020 jwcheon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // 1번 방법
    var blueViewConstraintY: NSLayoutConstraint!
    
    // 2번 방법
    var blueViewConstraintYUp: NSLayoutConstraint!
    var blueViewConstraintYDown: NSLayoutConstraint!
    
    lazy var moveButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("MOVE", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .black
        button.titleLabel?.font = .boldSystemFont(ofSize: 20)
        button.addTarget(self, action: #selector(clickedButton), for: .touchUpInside)
        return button
    }()
    
    @objc func clickedButton(_ sender: UIButton) {
        // 1번 방법
//        UIView.animate(withDuration: 1, animations: {
//            self.blueViewConstraintY.constant += 300
//            self.view.layoutIfNeeded()
//        }) { (_) in
//            UIView.animate(withDuration: 1) {
//                self.blueViewConstraintY.constant -= 300
//                self.view.layoutIfNeeded()
//            }
//        }
        
        // 2번 방법
        UIView.animate(withDuration: 1, animations: {
            self.blueViewConstraintYUp.priority = UILayoutPriority(998)
            self.view.layoutIfNeeded()
        }) { (_) in
            UIView.animate(withDuration: 1) {
                self.blueViewConstraintYUp.priority = UILayoutPriority(1000)
                self.view.layoutIfNeeded()
            }
        }
        
        // 3번 방법
//        UIView.animate(withDuration: 1) {
//            self.blueViewConstraintYUp.isActive = !self.blueViewConstraintYUp.isActive
//            self.view.layoutIfNeeded()
//        }
    }
    
    let blueView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBlue
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setLayoutSetting()
    }
    
    private func setLayoutSetting() {
        view.addSubview(moveButton)
        view.addSubview(blueView)
        
        // Button Layout
        moveButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            moveButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            moveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            moveButton.widthAnchor.constraint(equalToConstant: 200),
            moveButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        
        // BlueView Layout
        blueView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            blueView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            blueView.widthAnchor.constraint(equalToConstant: 200),
            blueView.heightAnchor.constraint(equalToConstant: 200)
        ])
        
        // 1번 방법
//        blueViewConstraintY = blueView.topAnchor.constraint(equalTo: moveButton.bottomAnchor, constant: 20)
//        blueViewConstraintY.isActive = true
        
        // 2번, 3번 방법
        blueViewConstraintYUp = blueView.topAnchor.constraint(equalTo: moveButton.bottomAnchor, constant: 20)
        blueViewConstraintYUp.priority = UILayoutPriority(1000)
        blueViewConstraintYUp.isActive = true
        
        blueViewConstraintYDown = blueView.topAnchor.constraint(equalTo: moveButton.bottomAnchor, constant: 320)
        blueViewConstraintYDown.priority = UILayoutPriority(999)
        blueViewConstraintYDown.isActive = true
    }
}

