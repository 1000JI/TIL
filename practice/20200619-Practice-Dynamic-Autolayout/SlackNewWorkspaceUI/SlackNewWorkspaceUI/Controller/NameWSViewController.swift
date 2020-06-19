//
//  NameWSViewController.swift
//  SlackNewWorkspaceUI
//
//  Copyright © 2020 giftbot. All rights reserved.
//

import UIKit

final class NameWSViewController: UIViewController {
    
    // MARK: - Properties
    
    let inputTextFieldView = InputTextFieldView()
    var inputName: String = ""
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    // MARK: - Helpers
    
    func configureUI() {
        view.backgroundColor = .white
        
        inputTextFieldView.delegate = self
        inputTextFieldView.model = InputModel(
            noticeText: "Name Your workspace",
            errorText: "",
            inputText: "",
            placeHolderText: "Name your workspace",
            inputType: .nameType
        )
        view.addSubview(inputTextFieldView)
        inputTextFieldView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            inputTextFieldView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            inputTextFieldView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            inputTextFieldView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 200)
        ])
        
        configureNavi()
    }
    
    func configureNavi() {
        let dismissButton = UIBarButtonItem(
            image: UIImage(systemName: "xmark"),
            style: .done,
            target: self,
            action: #selector(handleDismiss)
        )
        dismissButton.tintColor = .black
        navigationItem.leftBarButtonItem = dismissButton
        
        let nextButton = UIBarButtonItem(
            title: "Next",
            style: .done,
            target: self,
            action: #selector(handleNext)
        )
        nextButton.isEnabled = false
        navigationItem.rightBarButtonItem = nextButton
        navigationController?.navigationBar.barTintColor = .white
        
        // Navigationbar under line remove
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for:.default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.layoutIfNeeded()
    }
    
    // MARK: - Selectors
    
    @objc func handleDismiss() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func handleNext() {
        inputTextFieldView.startActivity()
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
            self.inputTextFieldView.stopActivity()
            let urlVC = UrlWSViewController()
            urlVC.delegate = self
            self.navigationController?.pushViewController(urlVC, animated: true)
        }
    }
}

// MARK: - InputTextFieldViewDelegate

extension NameWSViewController: InputTextFieldViewDelegate {
    func editingTextField(_ isEmpty: Bool, _ inputText: String) {
        navigationItem.rightBarButtonItem?.isEnabled = !isEmpty
        inputName = inputText
    }
}

// MARK: - UrlWSViewControllerDelegate

extension NameWSViewController: UrlWSViewControllerDelegate {
    func getNameText() -> String {
        return inputName
    }
}
