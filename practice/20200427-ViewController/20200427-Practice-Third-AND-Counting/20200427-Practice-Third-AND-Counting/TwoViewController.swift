//
//  TwoViewController.swift
//  20200427-Practice-Third-AND-Counting
//
//  Created by 천지운 on 2020/04/27.
//  Copyright © 2020 jwcheon. All rights reserved.
//

import UIKit

class TwoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray

        let topLabel = UILabel()
        topLabel.center = CGPoint(x: view.center.x, y: 100)
        topLabel.text = "B"
        topLabel.font = UIFont.boldSystemFont(ofSize: 35)
        topLabel.textAlignment = .center
        topLabel.sizeToFit()
        view.addSubview(topLabel)
        
        let dismissButton = UIButton(type: .system)
        dismissButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        dismissButton.setTitleColor(.white, for: .normal)
        dismissButton.setTitle("A로 되돌아가기", for: .normal)
        dismissButton.sizeToFit()
        dismissButton.center = CGPoint(x: view.center.x, y: view.center.y - 30)
        dismissButton.addTarget(self, action: #selector(clickedDismiss), for: .touchUpInside)
        view.addSubview(dismissButton)
        
        let nextButton = UIButton(type: .system)
        nextButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        nextButton.setTitleColor(.black, for: .normal)
        nextButton.setTitle("C로 이동", for: .normal)
        nextButton.sizeToFit()
        nextButton.center = CGPoint(x: view.center.x, y: view.center.y + 30)
        nextButton.addTarget(self, action: #selector(clickedNext), for: .touchUpInside)
        view.addSubview(nextButton)
    }
    
    @objc private func clickedDismiss(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc private func clickedNext(_ sender: UIButton) {
        let threeVC = ThreeViewController()
        threeVC.modalPresentationStyle = .fullScreen
        self.present(threeVC, animated: true)
    }

}
