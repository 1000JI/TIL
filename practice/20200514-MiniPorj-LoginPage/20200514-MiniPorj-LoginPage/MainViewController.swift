//
//  MainViewController.swift
//  20200514-MiniPorj-LoginPage
//
//  Created by 천지운 on 2020/05/14.
//  Copyright © 2020 jwcheon. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    var idLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
        label.font = .boldSystemFont(ofSize: 18)
        label.textAlignment = .center
        label.textColor = .black
        label.backgroundColor = .white
        return label
    }()
    
    lazy var logoutButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
        button.titleLabel?.font = .boldSystemFont(ofSize: 18)
        button.titleLabel?.textAlignment = .center
        button.backgroundColor = .darkGray
        button.setTitle("Logout", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(clickedLogout(_:)), for: .touchUpInside)
        return button
    }()
    
    let userDefaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()

        viewSetting()
    }
    
    private func viewSetting() {
        view.backgroundColor = .systemBackground
        idLabel.center = view.center
        idLabel.text = userDefaults.string(forKey: UserInfo.loginID)
        
        view.addSubview(idLabel)
        
        logoutButton.center = CGPoint(x: view.center.x, y: view.center.y + 100)
        view.addSubview(logoutButton)
    }
    
    @objc func clickedLogout(_ sender: UIButton) {
        userDefaults.set(nil, forKey: UserInfo.loginID)

//        let alert = UIAlertController(title: "\(self.presentingViewController as? ViewController)", message: "", preferredStyle: .alert)
//
//        present(alert, animated: true)
        
        if let _ = self.presentingViewController as? ViewController {
            self.dismiss(animated: true, completion: nil)
        } else {
            if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
                let window = UIWindow(windowScene: windowScene)
                let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let rootViewController = mainStoryboard.instantiateInitialViewController() as! ViewController
                rootViewController.view.backgroundColor = .systemBackground
                window.rootViewController = rootViewController

                let sceneDelegate = windowScene.delegate as? SceneDelegate
                sceneDelegate?.window = window
                window.makeKeyAndVisible()
            }
        }
    }
}
