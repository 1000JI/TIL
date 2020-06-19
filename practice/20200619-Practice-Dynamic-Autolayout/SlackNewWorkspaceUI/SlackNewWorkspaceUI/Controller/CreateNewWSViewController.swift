//
//  ViewController.swift
//  SlackNewWorkspaceUI
//
//  Copyright © 2020 giftbot. All rights reserved.
//

import UIKit

final class CreateNewWSViewController: UIViewController {

    // MARK: - Properties
    
    let moveButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Create New Workspace", for: .normal)
        button.titleLabel?.font = .preferredFont(forTextStyle: .title1)
        button.addTarget(self, action: #selector(handleButton), for: .touchUpInside)
        return button
    }()
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        configureUI()
    }
    
    // MARK: Helpers
    
    func configureUI() {
        view.addSubview(moveButton)
        moveButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            moveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            moveButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    // MARK: Selectors
    
    @objc func handleButton() {
        let controller = NameWSViewController()
        let naviController = UINavigationController(rootViewController: controller)
        naviController.modalPresentationStyle = .fullScreen
        present(naviController, animated: true)
    }
    
}
