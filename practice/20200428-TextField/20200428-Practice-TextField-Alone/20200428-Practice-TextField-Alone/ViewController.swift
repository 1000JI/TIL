//
//  ViewController.swift
//  20200428-Practice-TextField-Alone
//
//  Created by 천지운 on 2020/04/28.
//  Copyright © 2020 jwcheon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private let nicknameTextField = UITextField()
    private let emailTextField = UITextField()
    private let passwordTextField = UITextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nicknameTextField.frame = CGRect(x: Int(view.center.x), y: 100, width: 200, height: 35)
        nicknameTextField.font = .boldSystemFont(ofSize: 25)
        nicknameTextField.placeholder = "닉네임 입력"
        nicknameTextField.borderStyle = .line
        view.addSubview(nicknameTextField)
        
        nicknameTextField.addTarget(self, action: #selector(tfEditingChanged), for: .editingChanged
        )
        
        emailTextField.frame = CGRect(x: Int(view.center.x), y: 150, width: 200, height: 35)
        emailTextField.font = .boldSystemFont(ofSize: 25)
        emailTextField.placeholder = "이메일 입력"
        emailTextField.borderStyle = .line
        emailTextField.keyboardType = .emailAddress
        view.addSubview(emailTextField)
        
        passwordTextField.frame = CGRect(x: Int(view.center.x), y: 200, width: 200, height: 35)
        passwordTextField.font = .boldSystemFont(ofSize: 25)
        passwordTextField.placeholder = "패스워드 입력"
        passwordTextField.borderStyle = .line
        passwordTextField.isSecureTextEntry = true
        view.addSubview(passwordTextField)
    }
    
    @objc func tfEditingChanged(_ sender: UITextField) {
        print(sender.text?.last)
    }
}

