//
//  ThirdViewController.swift
//  20200512-Practice-Delegate-TextFieldandLabel
//
//  Created by 천지운 on 2020/05/12.
//  Copyright © 2020 jwcheon. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

    let textField = UITextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .systemTeal
        textField.frame.size = CGSize(width: 200, height: 50)
        textField.center = view.center
        textField.backgroundColor = .white
        textField.delegate = self
        
        self.view.addSubview(textField)
    }
}

extension ThirdViewController: UITextFieldDelegate, TextSendDelegate {
    func sendTextFunction() -> String {
        return textField.text ?? ""
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        let fourthVC = FourthViewController()
        fourthVC.delegate = self
        present(fourthVC, animated: true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
