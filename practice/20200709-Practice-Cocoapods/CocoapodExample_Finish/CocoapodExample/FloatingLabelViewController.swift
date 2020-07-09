//
//  FloatingLabelViewController.swift
//  CocoapodExample
//
//  Copyright © 2020 Giftbot. All rights reserved.
//

import UIKit
import SnapKit

final class FloatingLabelViewController: UIViewController {
  
  private lazy var wsNameTextField: UITextField = {
    let textField = UITextField()
    let attrString = NSAttributedString(
      string: "Name your workspace",
      attributes: [.foregroundColor: UIColor.darkText.withAlphaComponent(0.5)]
    )
    textField.attributedPlaceholder = attrString
    textField.font = UIFont.systemFont(ofSize: 22, weight: .light)
    textField.borderStyle = .none
    textField.returnKeyType = .go
    textField.autocorrectionType = .no
    textField.autocapitalizationType = .none
    textField.delegate = self
    return textField
  }()
  private let floatingLabel: UILabel = {
    let label = UILabel()
    label.text = "Name your workspace"
    label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
    label.alpha = 0.0
    return label
  }()
  

  override func viewDidLoad() {
    super.viewDidLoad()
    view.addSubview(wsNameTextField)
    view.addSubview(floatingLabel)
    view.setNeedsUpdateConstraints()
  }
  
  
  var didUpdateConstraints = false
  override func updateViewConstraints() {
    if !didUpdateConstraints {
      wsNameTextField.snp.makeConstraints {
        $0.leading.trailing.equalToSuperview().offset(16)
        $0.centerY.equalToSuperview().offset(-50)
      }
      floatingLabel.snp.makeConstraints {
        $0.leading.equalTo(wsNameTextField.snp.leading)
        $0.centerY.equalTo(wsNameTextField.snp.centerY)
      }
      didUpdateConstraints.toggle()
    }
    super.updateViewConstraints()
  }
}



extension FloatingLabelViewController: UITextFieldDelegate {
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    return true
  }
  
  
  func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    let text = textField.text ?? ""
    let replacedText = (text as NSString).replacingCharacters(in: range, with: string)
    
    UIView.animate(withDuration: 0.3, delay: 0, options: [], animations: {
      self.floatingLabel.alpha = replacedText.isEmpty ? 0.0 : 1.0
      let offsetAmount = replacedText.isEmpty ? 0 : -30
      self.floatingLabel.snp.updateConstraints {
        $0.centerY.equalTo(self.wsNameTextField.snp.centerY).offset(offsetAmount)
      }
      self.view.layoutIfNeeded()
    })
    return true
  }
}

