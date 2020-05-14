//
//  SceneDelegate.swift
//  20200514-MiniPorj-LoginPage
//
//  Created by 천지운 on 2020/05/14.
//  Copyright © 2020 jwcheon. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    let userDefaults = UserDefaults.standard
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        
        
        if let _ = userDefaults.string(forKey: UserInfo.loginID) {
            //print("autoLogin")
            let mainView = MainViewController()
            mainView.modalPresentationStyle = .fullScreen
            
            window?.rootViewController = mainView
        } else {
            // print("basicLogin")
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let loginView = storyboard.instantiateViewController(identifier: "ViewController") as! ViewController
            window?.rootViewController = loginView
        }
        
        window?.frame = UIScreen.main.bounds
        window?.makeKeyAndVisible()
    }
}

