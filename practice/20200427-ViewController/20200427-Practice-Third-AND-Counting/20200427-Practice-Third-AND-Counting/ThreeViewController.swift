//
//  ThreeViewController.swift
//  20200427-Practice-Third-AND-Counting
//
//  Created by 천지운 on 2020/04/27.
//  Copyright © 2020 jwcheon. All rights reserved.
//

import UIKit

class ThreeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemYellow
        
        let topLabel = UILabel()
        topLabel.center = CGPoint(x: view.center.x, y: 100)
        topLabel.text = "C"
        topLabel.font = UIFont.boldSystemFont(ofSize: 35)
        topLabel.textAlignment = .center
        topLabel.sizeToFit()
        view.addSubview(topLabel)
        
        let returnAbutton = UIButton(type: .system)
        returnAbutton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        returnAbutton.setTitle("A로 돌아가기", for: .normal)
        returnAbutton.sizeToFit()
        returnAbutton.center = CGPoint(x: view.center.x, y: view.center.y - 30)
        returnAbutton.setTitleColor(.systemRed, for: .normal)
        returnAbutton.addTarget(self, action: #selector(clickedReturnA(_:)), for: .touchUpInside)
        view.addSubview(returnAbutton)
        
        let returnBbutton = UIButton(type: .system)
        returnBbutton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        returnBbutton.setTitle("B로 돌아가기", for: .normal)
        returnBbutton.sizeToFit()
        returnBbutton.center = CGPoint(x: view.center.x, y: view.center.y + 30)
        returnBbutton.setTitleColor(.systemGreen, for: .normal)
        returnBbutton.addTarget(self, action: #selector(clickedReturnB(_:)), for: .touchUpInside)
        view.addSubview(returnBbutton)
    }
    
    @objc private func clickedReturnA(_ sender: UIButton) {
        self.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    @objc private func clickedReturnB(_ sender: UIButton) {
//        self.dismiss(animated: true, completion: nil)
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }

}
