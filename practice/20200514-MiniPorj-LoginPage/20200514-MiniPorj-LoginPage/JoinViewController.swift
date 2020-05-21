//
//  JoinViewController.swift
//  20200514-MiniPorj-LoginPage
//
//  Created by 천지운 on 2020/05/14.
//  Copyright © 2020 jwcheon. All rights reserved.
//

import UIKit

class JoinViewController: UIViewController {

    lazy var subLabelPadding = self.view.center.x - 150
    var subLabelSize = CGSize(width: 100, height: 50)
    var subTextFieldSize = CGSize(width: 200, height: 50)
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
        label.center = CGPoint(x: self.view.center.x, y: 300)
        label.text = "회원가입"
        label.font = .boldSystemFont(ofSize: 25)
        label.textAlignment = .center
        label.textColor = .black
        label.backgroundColor = .white
        label.layer.borderColor = UIColor.black.cgColor
        label.layer.borderWidth = 1
        return label
    }()
    
    lazy var idLabel: UILabel = {
        let label = UILabel()
        label.frame.size = self.subLabelSize
        label.frame.origin = CGPoint(x: self.subLabelPadding, y: self.view.center.y - 50)
        label.text = "ID"
        label.font = .boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        label.textColor = .black
        label.backgroundColor = .white
        return label
    }()
    
    lazy var pwLabel: UILabel = {
        let label = UILabel()
        label.frame.size = self.subLabelSize
        label.frame.origin = CGPoint(x: self.subLabelPadding, y: self.view.center.y + 50)
        label.text = "PW"
        label.font = .boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        label.textColor = .black
        label.backgroundColor = .white
        return label
    }()
    
    lazy var idTextField: UITextField = {
        let textField = UITextField()
        textField.frame.size = subTextFieldSize
        textField.frame.origin = CGPoint(x: self.subLabelPadding + self.subLabelSize.width + 10, y: self.view.center.y - 50)
        textField.placeholder = "ID를 입력하세요."
        textField.font = .boldSystemFont(ofSize: 18)
        textField.textAlignment = .center
        textField.textColor = .black
        textField.backgroundColor = .white
        textField.borderStyle = .roundedRect
        textField.delegate = self
        return textField
    }()
    
    lazy var pwTextField: UITextField = {
        let textField = UITextField()
        textField.frame.size = subTextFieldSize
        textField.frame.origin = CGPoint(x: self.subLabelPadding + self.subLabelSize.width + 10, y: self.view.center.y + 50)
        textField.placeholder = "PW를 입력하세요."
        textField.font = .boldSystemFont(ofSize: 18)
        textField.textAlignment = .center
        textField.textColor = .black
        textField.backgroundColor = .white
        textField.borderStyle = .roundedRect
        textField.isSecureTextEntry = true
        textField.delegate = self
        return textField
    }()
    
    lazy var signUpButton: UIButton = {
        let button = UIButton()
        button.frame.size = CGSize(width: 200, height: 50)
        button.center = CGPoint(x: self.view.center.x, y: self.view.frame.maxY - 250)
        button.titleLabel?.font = .boldSystemFont(ofSize: 20)
        button.setTitle("Sign Up", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .darkGray
        button.addTarget(self, action: #selector(clickedSignUP(_:)), for: .touchUpInside)
        return button
    }()
    
    let userDefaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()

        viewSetting()
    }
    
    @objc private func clickedSignUP(_ sender: UIButton) {
        if idTextField.text!.count < 4 || pwTextField.text!.count < 4 {
            let alert = UIAlertController(title: "회원가입 오류", message: "ID 또는 PW를 4자 이상 입력해주세요,", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "확인", style: .default, handler: nil))
            present(alert, animated: true)
        } else {
            if var joinList = userDefaults.dictionary(forKey: UserInfo.joinList) {
                if joinList.keys.contains(idTextField.text!) {
                    // 중복된 아이디가 있을 경우
                    let alert = UIAlertController(title: "가입 실패", message: "중복된 아이디가 있습니다.", preferredStyle: .alert)
                    
                    alert.addAction(UIAlertAction(title: "확인", style: .default, handler: { (_) in
                        return
                    }))
                    
                    self.present(alert, animated: true)
                } else {
                    // 중복된 아이디가 없을 경우
                    joinList["\(idTextField.text!)"] = "\(pwTextField.text!)"
                }
                userDefaults.set(joinList, forKey: UserInfo.joinList)
            } else {
                let joinList = ["\(idTextField.text!)" : "\(pwTextField.text!)"]
                userDefaults.set(joinList, forKey: UserInfo.joinList)
            }
            
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    private func viewSetting() {
        view.backgroundColor = .systemBackground
        
        view.addSubview(titleLabel)
        
        view.addSubview(idLabel)
        view.addSubview(idTextField)
        
        view.addSubview(pwLabel)
        view.addSubview(pwTextField)
        
        view.addSubview(signUpButton)
    }
}

extension JoinViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField.text!.count + string.count > 16 {
            return false
        }
        return true
    }
}
