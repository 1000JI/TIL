//
//  TextInsertViewController.swift
//  20200428-Practice-TextField-Alone
//
//  Created by 천지운 on 2020/04/28.
//  Copyright © 2020 jwcheon. All rights reserved.
//

import UIKit

class TextInsertViewController: UIViewController, UITextFieldDelegate {

    private let textViewLabel = UILabel()
    private let textInputField = UITextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textViewLabel.frame = CGRect(x: 0, y: 50, width: view.frame.width, height: 100)
        textViewLabel.layer.borderColor = UIColor.darkGray.cgColor
        textViewLabel.layer.borderWidth = 1
        textViewLabel.textAlignment = .center
        
        view.addSubview(textViewLabel)
        
        textInputField.frame = CGRect(x: 30, y: 200, width: view.frame.width - 60, height: 50)
        textInputField.borderStyle = .bezel
        textInputField.textAlignment = .center
        textInputField.font = .systemFont(ofSize: 25)
        
        // TextField Delegate ADD
        textInputField.delegate = self
        
        textInputField.addTarget(self, action: #selector(textEditingChange(_:)), for: .editingChanged)
        textInputField.addTarget(self, action: #selector(startEditTextField(_:)), for: .editingDidBegin)
        textInputField.addTarget(self, action: #selector(endEditTextField(_:)), for: .editingDidEnd)
        textInputField.addTarget(self, action: #selector(textEditDidEndOnExit(_:)), for: .editingDidEndOnExit)
//        textInputField.addTarget(self, action: #selector(primaryActionTriggered(_:)), for: .primaryActionTriggered)
        
        view.addSubview(textInputField)
    }
    
    @objc func startEditTextField(_ sender: UITextField) {
//        print("startEditTextField")
        textViewLabel.font = .boldSystemFont(ofSize: 40)
        textViewLabel.textColor = .blue
    }
    
    @objc func endEditTextField(_ sender: UITextField) {
//        print("endEditTextField")
        textViewLabel.font = .systemFont(ofSize: 20)
        textViewLabel.textColor = .red
    }
    
    @objc func textEditingChange(_ sender: UITextField) {
//        print("textEditingChange")
//        if sender.text!.count > 10 {
//            sender.text?.removeLast()
//        }
        self.textViewLabel.text = sender.text
    }
    
    @objc func textEditDidEndOnExit(_ sender: UITextField) {
//        print("textEditDidEndOnExit")
        // UITextField의 편집상태에서 키보드의 return 키를 터치했을 때 발생하는 이벤트 > UIControl.Event.editingDidEndOnExit
        self.isEditing = true
    }
        
    @objc func primaryActionTriggered(_ sender: UITextField) {
//        print("primaryActionTriggered")
        // 버튼이 눌릴때 발생하는 이벤트 (iOS보다는 tvOS에서 사용) > UIControl.Event.primaryActionTriggered
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if string == "\n" { return true }
        
        let currentCharacterCount = textField.text?.count ?? 0
        print("Text: ", textField.text!, "Input: ", string, "Range: ", range)
        
        if range.length + range.location > currentCharacterCount {
            return false
        }
        print(range.length, range.location)
        
        let newLength = currentCharacterCount + string.count - range.length // 10 + 1 - 0
        return newLength <= 10
    }
}
