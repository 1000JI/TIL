//
//  UrlWSViewController.swift
//  SlackNewWorkspaceUI
//
//  Copyright © 2020 giftbot. All rights reserved.
//

import UIKit

protocol UrlWSViewControllerDelegate: class {
    func getNameText() -> String
}

final class UrlWSViewController: UIViewController {
  
    // MARK: - Properties
    
    weak var delegate: UrlWSViewControllerDelegate?
    
    let inputTextFieldView = InputTextFieldView()
    var urlText: String = ""
    
    let signLabel: UILabel = {
        let label = UILabel()
        label.text = "This is the address that you'll use to sign in to Slack"
        label.font = .boldSystemFont(ofSize: 12)
        label.textColor = .lightGray
        return label
    }()
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    // MARK: Helpers
    
    func configureUI() {
        view.backgroundColor = .white
        
        inputTextFieldView.delegate = self
        inputTextFieldView.model = InputModel(
            noticeText: "Get a URL (Letters, numbers, and dashes only)",
            errorText: "This URL is not available. Sorry!",
            inputText: delegate?.getNameText() ?? "",
            placeHolderText: "URL your workspace",
            inputType: .urlType
        )
        view.addSubview(inputTextFieldView)
        inputTextFieldView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            inputTextFieldView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            inputTextFieldView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            inputTextFieldView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 200)
        ])
        
        view.addSubview(signLabel)
        signLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            signLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signLabel.topAnchor.constraint(equalTo: inputTextFieldView.bottomAnchor, constant: 100)
        ])
        
        configureNavi()
    }
    
    func configureNavi() {
        let dismissButton = UIBarButtonItem(
            image: UIImage(systemName: "arrow.left"),
            style: .done,
            target: self,
            action: #selector(handleDismiss)
        )
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
        navigationController?.popViewController(animated: true)
    }
    
    @objc func handleNext() {
        inputTextFieldView.inputText = urlText
    }
    
}

extension UrlWSViewController: InputTextFieldViewDelegate {
    func editingTextField(_ isEmpty: Bool, _ inputText: String) {
        navigationItem.rightBarButtonItem?.isEnabled = !isEmpty
        urlText = inputText
    }
}
