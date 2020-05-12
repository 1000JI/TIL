//
//  FirstViewController.swift
//  20200512-Practice-Delegate-TextFieldandLabel
//
//  Created by 천지운 on 2020/05/12.
//  Copyright © 2020 jwcheon. All rights reserved.
//

import UIKit

/*
 Delegate 를 이용하여 FirstVC의 TextField 에 입력한 값을 SecondVC 의 Label에 표시하기
 1-1. delegate 프로토콜과 프로퍼티를 firstVC 에 정의하는 방법으로 구현
      e.g. class FirstVC { weak var delegate: ~~~ }
 */

// MARK: - Protocol
protocol RiffleDelegate: class {
    func nextViewNextRiffle(_ inputText: String)
}

// MARK: - FirstViewController
class FirstViewController: UIViewController, UITextFieldDelegate {
    weak var delegate: RiffleDelegate?
    
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
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        let secondVC = SecondViewController()
        
        delegate = secondVC
        delegate?.nextViewNextRiffle(textField.text ?? "")
        
        self.present(secondVC, animated: true)
        
//        self.present(secondVC, animated: true, completion: {
//            self.delegate?.nextViewNextRiffle(textField.text ?? "")
//        })
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
