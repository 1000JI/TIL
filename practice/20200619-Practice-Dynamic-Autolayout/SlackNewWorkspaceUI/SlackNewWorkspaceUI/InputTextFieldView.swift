//
//  InputTextFieldView.swift
//  SlackNewWorkspaceUI
//
//  Created by 천지운 on 2020/06/19.
//  Copyright © 2020 giftbot. All rights reserved.
//

import UIKit

protocol InputTextFieldViewDelegate: class {
    func editingTextField(_ isEmpty: Bool, _ inputText: String)
}

class InputTextFieldView: UIView {
    
    // MARK: - Properties
    
    weak var delegate: InputTextFieldViewDelegate?
    
    var inputType: InputType = .nameType
    var inputText: String? {
        didSet {
            if let text = inputText {
                if text.lowercased() == "error" {
                    UIView.animate(
                        withDuration: 0.5,
                        delay: 0,
                        usingSpringWithDamping: 0.1,
                        initialSpringVelocity: 5,
                        animations: {
                            self.textField.transform = CGAffineTransform(translationX: -5, y: 0)
                            self.urlLabel.transform = CGAffineTransform(translationX: -5, y: 0)
                    }) { _ in
                        self.textField.transform = .identity
                        self.urlLabel.transform = .identity
                    }
                    errorLabel.alpha = 1
                }
            }
        }
    }
    var model: InputModel? {
        didSet {
            configure()
        }
    }
    
    let noticeLabel: UILabel = {
        let label = UILabel()
        label.text = "Name Your workspace"
        label.font = .boldSystemFont(ofSize: 12)
        label.textAlignment = .left
        label.alpha = 0
        return label
    }()
    
    lazy var textField: UITextField = {
        let tf = UITextField()
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
    
    let placeHolderLabel: UILabel = {
        let label = UILabel()
        label.text = "Name your workspace"
        label.font = .systemFont(ofSize: 22)
        label.textColor = .lightGray
        return label
    }()
    
    let urlLabel: UILabel = {
        let label = UILabel()
        label.text = ".slack.com"
        label.font = .systemFont(ofSize: 22)
        label.textColor = .lightGray
        label.isHidden = true
        return label
    }()
    
    let activityIndicatorView = UIActivityIndicatorView()
    
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
        [noticeLabel, textField, errorLabel, placeHolderLabel, activityIndicatorView, urlLabel].forEach {
            addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            noticeLabel.topAnchor.constraint(equalTo: topAnchor),
            noticeLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            noticeLabel.widthAnchor.constraint(equalTo: widthAnchor)
        ])
        
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: noticeLabel.bottomAnchor),
            textField.leadingAnchor.constraint(equalTo: leadingAnchor),
            textField.bottomAnchor.constraint(equalTo: errorLabel.topAnchor)
        ])
        
        NSLayoutConstraint.activate([
            errorLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            errorLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            errorLabel.widthAnchor.constraint(equalTo: widthAnchor)
        ])
        
        NSLayoutConstraint.activate([
            activityIndicatorView.leadingAnchor.constraint(equalTo: textField.trailingAnchor, constant: 8),
            activityIndicatorView.centerYAnchor.constraint(equalTo: textField.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            urlLabel.leadingAnchor.constraint(equalTo: textField.trailingAnchor),
            urlLabel.centerYAnchor.constraint(equalTo: textField.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            placeHolderLabel.topAnchor.constraint(equalTo: textField.topAnchor),
            placeHolderLabel.leadingAnchor.constraint(equalTo: textField.leadingAnchor),
            placeHolderLabel.bottomAnchor.constraint(equalTo: textField.bottomAnchor)
        ])
        
        textField.becomeFirstResponder()
    }
    
    func configure() {
        noticeLabel.text = model?.noticeText
        errorLabel.text = model?.errorText
        placeHolderLabel.text = model?.placeHolderText
        textField.text = model?.inputText
        if let type = model?.inputType { inputType = type }
        
        switch inputType {
        case .nameType:
            break
        case .urlType:
            noticeLabel.alpha = 1
            placeHolderLabel.isHidden = true
            urlLabel.isHidden = false
        }
    }
    
    // MARK: - Actions
    
    func startActivity() { activityIndicatorView.startAnimating() }
    func stopActivity() { activityIndicatorView.stopAnimating() }
    
}

// MARK: - UITextFieldDelegate

extension InputTextFieldView: UITextFieldDelegate {
    @objc func textEditingChange(_ sender: UITextField) {
        
        if sender.text?.count ?? 0 > 15 {
            sender.text?.removeLast(1)
            return
        }
        
        switch inputType {
        case .nameType:
            if sender.text?.isEmpty ?? true {
                noticeLabelAnimate(false)
                delegate?.editingTextField(true, sender.text ?? "")
                placeHolderLabel.isHidden = false
            } else {
                delegate?.editingTextField(false, sender.text ?? "")
                placeHolderLabel.isHidden = true
            }
        case .urlType:
            if sender.text?.isEmpty ?? true {
                delegate?.editingTextField(true, sender.text ?? "")
            } else {
                delegate?.editingTextField(false, sender.text ?? "")
            }
        }
        
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        switch inputType {
        case .nameType:
            if textField.text?.count == 0, string.count > 0 {
                noticeLabelAnimate(true)
            }
        case .urlType:
            break
        }
        return true
    }
    
    func noticeLabelAnimate(_ isView: Bool) {
        let moveDistance = textField.center.y - noticeLabel.center.y
        
        if isView {
            noticeLabel.transform = CGAffineTransform(translationX: 0, y: moveDistance)
            noticeLabel.alpha = 0
            
            UIView.animate(withDuration: 0.3) {
                self.noticeLabel.alpha = 1
                self.noticeLabel.transform = .identity
            }
        } else {
            noticeLabel.alpha = 1
            
            UIView.animate(withDuration: 0.3, animations: {
                self.noticeLabel.transform = CGAffineTransform(translationX: 0, y: moveDistance)
                self.noticeLabel.alpha = 0
            }) { _ in
                self.noticeLabel.transform = .identity
            }
        }
    }
}
