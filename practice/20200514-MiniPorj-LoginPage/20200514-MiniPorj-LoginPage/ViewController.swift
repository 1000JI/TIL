//
//  ViewController.swift
//  20200514-MiniPorj-LoginPage
//
//  Created by 천지운 on 2020/05/14.
//  Copyright © 2020 jwcheon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var dotView1: UIImageView!
    @IBOutlet var dotView2: UIImageView!
    @IBOutlet var dotView3: UIImageView!
    
    @IBOutlet var emailImageView: UIImageView!
    @IBOutlet var passwordImageView: UIImageView!
    
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var signInButton: UIButton!
    @IBOutlet var signUpButton: UIButton!
    
    let userDefaults = UserDefaults.standard
    
    // Keyboadr 올라갔는지 여부 체크
    private var isKeyboardUP: Bool = false
    private lazy var upUIViews = [emailTextField, passwordTextField, signInButton, emailImageView, passwordImageView, signUpButton]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewSetting()
    }
    
    // MARK: - UI View Seting
    private func viewSetting() {
        let dotViews = [dotView1, dotView2, dotView3]
        
        for dotView in dotViews {
            dotView?.layer.cornerRadius = 10
            dotView?.backgroundColor = .systemPink
        }
        
        emailTextField.placeholder = "이메일을 입력하세요"
        emailTextField.font = .boldSystemFont(ofSize: 18)
        emailTextField.borderStyle = .none
        emailTextField.delegate = self
        addTextFieldUnderLine(emailTextField)
        
        passwordTextField.placeholder = "비밀번호를 입력하세요"
        passwordTextField.font = .systemFont(ofSize: 18)
        passwordTextField.isSecureTextEntry = true
        passwordTextField.borderStyle = .none
        passwordTextField.delegate = self
        addTextFieldUnderLine(passwordTextField)
        
        signInButton.layer.cornerRadius = 10
        signInButton.setTitle("Sign In", for: .normal)
        signInButton.backgroundColor = .darkGray
        signInButton.setTitleColor(.white, for: .normal)
        signInButton.titleLabel?.font = .boldSystemFont(ofSize: 20)
        signInButton.addTarget(self, action: #selector(clickedSignIn(_:)), for: .touchUpInside)
        
        signUpButton.layer.cornerRadius = 10
        signUpButton.setTitle("Sign Up", for: .normal)
        signUpButton.backgroundColor = .darkGray
        signUpButton.setTitleColor(.white, for: .normal)
        signUpButton.titleLabel?.font = .boldSystemFont(ofSize: 20)
        signUpButton.addTarget(self, action: #selector(clickedSignUp), for: .touchUpInside)
        
        addKeyboardNotification()
    }
    
    // MARK: SignUPButton
    @objc private func clickedSignUp(_ sender: UIButton) {
        let signupVC = JoinViewController()
        signupVC.modalPresentationStyle = .automatic
        present(signupVC, animated: true)
    }
    
    // MARK: LoginButton
    @objc private func clickedSignIn(_ sender: UIButton) {
        userLogin()
    }
    
    // MARK: View UnderLine 그리기
    private func addTextFieldUnderLine(_ textField: UITextField) {
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0.0, y: textField.frame.height - 1, width: textField.frame.width, height: 1.0)
        bottomLine.backgroundColor = UIColor.lightGray.cgColor
        textField.layer.addSublayer(bottomLine)
    }
    
    // MARK: Login Method
    private func userLogin() {
        if emailTextField.text!.count < 4 || passwordTextField.text!.count < 4 {
            let alert = UIAlertController(title: "로그인 오류", message: "ID 또는 PW를 4자 이상 입력해주세요,", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "확인", style: .default, handler: nil))
            present(alert, animated: true)
        } else {
            if let loginList = userDefaults.dictionary(forKey: UserInfo.joinList) {
                if loginList.keys.contains(emailTextField.text!) && loginList.values.contains(where: { (password) -> Bool in
                    password as! String == self.passwordTextField.text!
                }) {
                    userDefaults.set(emailTextField.text!, forKey: UserInfo.loginID)
                    
                    let mainView = MainViewController()
                    mainView.modalPresentationStyle = .fullScreen
                    
                    present(mainView, animated: true)
                } else {
                    UIView.animate(withDuration: 0.3, animations: {
                        self.emailTextField.backgroundColor = .systemRed
                        self.passwordTextField.backgroundColor = .systemRed
                    }) { (_) in
                        UIView.animate(withDuration: 0.3) {
                            self.emailTextField.backgroundColor = .white
                            self.passwordTextField.backgroundColor = .white
                        }
                    }
                }
            }
            
            
            emailTextField.text = ""
            passwordTextField.text = ""
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        removeKeyboardNotification()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        addKeyboardNotification()
    }
}


extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if let text = textField.text {
            if text.count + string.count > 16 {
                return false
            }
        }
        return true
    }
}

extension ViewController {
    private func addKeyboardNotification() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillShow),
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillHide),
            name: UIResponder.keyboardWillHideNotification,
            object: nil
        )
    }
    
    private func removeKeyboardNotification() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc private func keyboardWillShow(_ notification: Notification) {
        if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            if !isKeyboardUP {
                print("isKeyboardUP-")
                let keybaordRectangle = keyboardFrame.cgRectValue
                let keyboardHeight = keybaordRectangle.height
                
                UIView.animate(withDuration: 0.3, animations: {
                    for moveView in self.upUIViews {
                        moveView?.transform = CGAffineTransform(translationX: 0, y: -keyboardHeight)
                    }
                })
                isKeyboardUP = !isKeyboardUP
                
//                for moveView in upUIViews {
//                    moveView?.frame.origin.y -= keyboardHeight
//                }
            }
        }
    }
    
    @objc private func keyboardWillHide(_ notification: Notification) {
        if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            if isKeyboardUP {
                print("isKeyboardUP+")
                
                UIView.animate(withDuration: 0.3, animations: {
                    for moveView in self.upUIViews {
                        moveView?.transform = .identity
                    }
                })
                isKeyboardUP = !isKeyboardUP
                
//                for moveView in upUIViews {
//                    moveView?.frame.origin.y += keyboardHeight
//                }
            }
        }
    }
}

/*
 1. CornerRadius를 이용한 원 만들기
 someView.layer.cornerRadius = someView.frame.width / 2

 2. 애니메이션
 UIView.animate(withDuration: 0.3) {
    // 애니메이션 코드
 }

 3. SceneDelegate의 window에 접근해 활용하기
 if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
       let sceneDelegate = windowScene.delegate as? SceneDelegate
       sceneDelegate?.window?.rootViewController = SignInViewController()
     }

 4. Storyboard에 있는 뷰컨트롤러 가져오기
 let storyboard = UIStoryboard(name: "Main", bundle: nil)
 let mainVC = storyboard.instantiateViewController(withIdentifier: "MainViewController")
 */
