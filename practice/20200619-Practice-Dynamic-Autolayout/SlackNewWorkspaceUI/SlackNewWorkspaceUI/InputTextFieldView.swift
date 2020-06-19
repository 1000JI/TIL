//
//  InputTextFieldView.swift
//  SlackNewWorkspaceUI
//
//  Created by 천지운 on 2020/06/19.
//  Copyright © 2020 giftbot. All rights reserved.
//

import UIKit

protocol InputTextFieldViewDelegate: class {
    func editingTextField(_ isEmpty: Bool)
}

class InputTextFieldView: UIView {
    
    // MARK: - Properties
    
    weak var delegate: InputTextFieldViewDelegate?
    
    let placeHolderLabel: UILabel = {
        let label = UILabel()
        label.text = "Name Your workspace"
        label.font = .boldSystemFont(ofSize: 12)
        label.textAlignment = .left
        label.alpha = 0
        return label
    }()
    
    lazy var textField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Name your workspace"
        tf.font = .systemFont(ofSize: 22)
        tf.delegate = self
        tf.addTarget(self, action: #selector(textEditingChange), for: .editingChanged)
        return tf
    }()
    
    let errorLabel: UILabel = {
        let label = UILabel()
        label.text = "This URL is not available. Sorry!"
        label.font = .boldSystemFont(ofSize: 12)
        label.textColor = .lightGray
        label.alpha = 0
        return label
    }()
    
    // MARK: - LifeCycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Helpers
    
    func configureUI() {
        [placeHolderLabel, textField, errorLabel].forEach {
            addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        }
        
        NSLayoutConstraint.activate([
            placeHolderLabel.topAnchor.constraint(equalTo: topAnchor),
            placeHolderLabel.leadingAnchor.constraint(equalTo: leadingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: placeHolderLabel.bottomAnchor),
            textField.leadingAnchor.constraint(equalTo: leadingAnchor),
            textField.bottomAnchor.constraint(equalTo: errorLabel.topAnchor)
        ])
        
        NSLayoutConstraint.activate([
            errorLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            errorLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
}

// MARK: - UITextFieldDelegate

extension InputTextFieldView: UITextFieldDelegate {
    @objc func textEditingChange(_ sender: UITextField) {
        if sender.text?.isEmpty ?? true {
            placeHolderAnimate(false)
            delegate?.editingTextField(true)
        } else {
            delegate?.editingTextField(false)
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if textField.text?.count == 0, string.count > 0 {
            placeHolderAnimate(true)
        }
        
        return true
    }
    
    func placeHolderAnimate(_ isView: Bool) {
        let moveDistance = textField.center.y - placeHolderLabel.center.y
        
        if isView {
            placeHolderLabel.transform = CGAffineTransform(translationX: 0, y: moveDistance)
            placeHolderLabel.alpha = 0
            
            UIView.animate(withDuration: 0.3) {
                self.placeHolderLabel.alpha = 1
                self.placeHolderLabel.transform = .identity
            }
        } else {
            placeHolderLabel.alpha = 1
            
            UIView.animate(withDuration: 0.3, animations: {
                self.placeHolderLabel.transform = CGAffineTransform(translationX: 0, y: moveDistance)
                self.placeHolderLabel.alpha = 0
            }) { _ in
                self.placeHolderLabel.transform = .identity
            }
        }
    }
}
