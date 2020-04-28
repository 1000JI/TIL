//
//  ViewController.swift
//  20200428-Practice-UITextField
//
//  Created by 천지운 on 2020/04/28.
//  Copyright © 2020 jwcheon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var idTextField: UITextField!
    
    private let nicknameTextField = UITextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
        nicknameTextField.frame = CGRect(x: 30, y: 100, width: 300, height: 40)
        nicknameTextField.placeholder = "이름 입력"
        nicknameTextField.font = .boldSystemFont(ofSize: 20)
        nicknameTextField.textAlignment = .center
        
        // true면 패스워드처럼 입력 됨 또한 다시 입력하려고 하면 초기화 됨
        nicknameTextField.isSecureTextEntry = false
        nicknameTextField.keyboardType = .URL
        nicknameTextField.borderStyle = .line
        
        nicknameTextField.addTarget(self, action: #selector(textFieldEditingDidBegin(_:)), for: .editingDidBegin)
        nicknameTextField.addTarget(self, action: #selector(textFieldEditingChanged(_:)), for: .editingChanged)
    
        view.addSubview(nicknameTextField)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        idTextField.becomeFirstResponder()
    }
    
    @IBAction func clickedButton(_ sender: UIButton) {
        // idTextField 키보드일때만 내려감
//        idTextField.resignFirstResponder()
        
        // 언제나 키보드 내려가게 하려면
        view.endEditing(true)
    }
    
    
    @IBAction func textFieldEditingDidBegin(_ sender: UITextField) {
        print("1. textFieldEditingDidBegin")
    }
    
    @IBAction func textFieldEditingChanged(_ sender: UITextField) {
        print("2. textFieldEditingChanged")
        print(sender.text?.last)
//        print(sender.tag)
    }

    @IBAction func textFieldDidEndOnExit(_ sender: UITextField) {
        // 다른 텍스트 필드로 옮길때는 동작하지 않음
        print("3. textFieldDidEndOnExit")
    }
    
    @IBAction func textFieldPrimaryActionTriggered(_ sender: UITextField) {
        // Enter가 눌렀을 때?(Return)
        print("4. textFieldPrimaryActionTriggered")
    }
    
    @IBAction func textFieldEditingDidEnd(_ sender: UITextField) {
        print("5. textFieldEditingDidEnd")
//        print(sender.text)
    }
    
}

