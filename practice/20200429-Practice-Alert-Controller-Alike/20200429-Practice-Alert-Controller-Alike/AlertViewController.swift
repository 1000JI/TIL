//
//  AlertViewController.swift
//  20200429-Practice-Alert-Controller-Alike
//
//  Created by 천지운 on 2020/04/29.
//  Copyright © 2020 jwcheon. All rights reserved.
//

import UIKit

class AlertViewController: UIViewController {

    let alertView = UIView()
    let titleLabel = UILabel()
    let subLabel = UILabel()
    let inputTextField = UITextField()
    let cancelButton = UIButton(type: .system)
    let okButton = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        
        // 배경화면
        alertView.frame.size = CGSize(width: 300, height: 300)
        alertView.center = view.center
        alertView.backgroundColor = .white
        
        view.addSubview(alertView)
        
        titleLabel.textColor = .black
        titleLabel.font = .systemFont(ofSize: 30)
        titleLabel.text = "Title"
        titleLabel.textAlignment = .center
//        titleLabel.frame.size = CGSize(width: 200, height: 50)
//        titleLabel.center = CGPoint(x: alertView.center.x - 50, y: 50)
        titleLabel.frame = CGRect(x: alertView.frame.width / 2 - 100, y: 30, width: 200, height: 50)
        
        alertView.addSubview(titleLabel)
        
        subLabel.textColor = .black
        subLabel.font = .systemFont(ofSize: 20)
        subLabel.text = "Message"
        subLabel.textAlignment = .center
//        subLabel.frame.size = CGSize(width: 200, height: 50)
//        subLabel.center = CGPoint(x: alertView.center.x - 50, y: 100)
        subLabel.frame = CGRect(x: alertView.frame.width / 2 - 100, y: 80, width: 200, height: 50)
        
        alertView.addSubview(subLabel)
        
        inputTextField.frame = CGRect(x: alertView.center.x - 150, y: 150, width: 200, height: 50)
        inputTextField.borderStyle = .roundedRect
        alertView.addSubview(inputTextField)
        
        cancelButton.setTitle("Cancel", for: .normal)
        cancelButton.setTitleColor(.black, for: .normal)
        cancelButton.titleLabel?.font = .boldSystemFont(ofSize: 20)
        cancelButton.frame = CGRect(x: 0, y: alertView.frame.height - 50, width: alertView.frame.size.width / 2, height: 50)
        cancelButton.addTarget(self, action: #selector(clickedDismiss(_:)), for: .touchUpInside)

        alertView.addSubview(cancelButton)

        okButton.setTitle("Enter", for: .normal)
        okButton.setTitleColor(.black, for: .normal)
        okButton.titleLabel?.font = .boldSystemFont(ofSize: 20)
        okButton.frame = CGRect(x: alertView.frame.width / 2, y: alertView.frame.height - 50, width: alertView.frame.size.width / 2, height: 50)
        okButton.addTarget(self, action: #selector(clickedOK(_:)), for: .touchUpInside)

        alertView.addSubview(okButton)
    }
    
    @objc private func clickedDismiss(_ sender: UIButton) {
        self.dismiss(animated: false, completion: nil)
    }
    
    @objc private func clickedOK(_ sender: UIButton) {
        if let vc = self.presentingViewController as? ViewController {
            vc.content = inputTextField.text!
        }
        
        self.dismiss(animated: false, completion: nil)
    }
}
