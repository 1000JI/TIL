//
//  FloatingLabelViewController.swift
//  CocoapodExample
//
//  Copyright © 2020 Giftbot. All rights reserved.
//

import UIKit
import SnapKit

final class FloatingLabelViewController: UIViewController {
    
    // MARK: - Properties
    
    private var isTextInput: Bool = false
    
    private lazy var loginTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Name your workspace"
        tf.font = .boldSystemFont(ofSize: 24)
        tf.addTarget(self, action: #selector(editingTextField), for: .editingChanged)
        return tf
    }()
    
    private let placeholderLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Name your workspace"
        lb.font = .systemFont(ofSize: 20)
        lb.textColor = .lightGray
        lb.alpha = 0
        return lb
    }()
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    // MARK: - Selectors
    
    @objc func editingTextField(_ sender: UITextField) {
        guard let text = sender.text else { return }
        
        if text.count == 0 {
            isTextInput = false
            UIView.animate(withDuration: 0.5) {
                self.placeholderLabel.snp.updateConstraints {
                    $0.top.equalTo(self.loginTextField)
                }
                self.placeholderLabel.alpha = 0
                self.view.layoutIfNeeded()
            }
        } else if !isTextInput && text.count > 0 {
            isTextInput = true
            UIView.animate(withDuration: 0.5) {
                self.placeholderLabel.snp.updateConstraints {
                    $0.top.equalTo(self.loginTextField).offset(-self.loginTextField.frame.height)
                }
                self.placeholderLabel.alpha = 1
                self.view.layoutIfNeeded()
            }
        }
    }
    
    // MARK : - Helpers
    
    func configureUI() {
        view.addSubview(loginTextField)
        loginTextField.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview().offset(-50)
            $0.height.equalTo(50)
            $0.width.equalTo(view.frame.width - 100)
        }
        
        view.addSubview(placeholderLabel)
        placeholderLabel.snp.makeConstraints {
            $0.edges.equalTo(loginTextField)
        }
    }
}

