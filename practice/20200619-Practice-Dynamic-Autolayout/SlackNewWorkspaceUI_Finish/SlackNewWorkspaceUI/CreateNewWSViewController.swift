//
//  ViewController.swift
//  SlackNewWorkspaceUI
//
//  Copyright © 2020 giftbot. All rights reserved.
//

import UIKit

final class CreateNewWSViewController: UIViewController {
    
    private let createWSButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Create New Workspace", for: .normal)
        button.titleLabel?.font = UIFont.preferredFont(forTextStyle: .title2)
        button.addTarget(self, action: #selector(didTapCreateWSButton(_:)), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(createWSButton)
        createWSButton.layout.centerX().centerY()
    }
    
    @objc func didTapCreateWSButton(_ sender: UIButton) {
        let vc = NameWSViewController()
        let naviController = UINavigationController(rootViewController: vc)
        naviController.modalPresentationStyle = .fullScreen
        present(naviController, animated: true)
    }
}

