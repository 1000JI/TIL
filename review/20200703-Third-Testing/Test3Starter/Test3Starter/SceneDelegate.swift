//
//  SceneDelegate.swift
//  Test3Starter
//
//  Created by Lee on 2020/07/03.
//  Copyright © 2020 Kira. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: windowScene)
        
        let controller = ViewController()
        let naviController = UINavigationController(rootViewController: controller)
        window?.rootViewController = naviController
        window?.frame = UIScreen.main.bounds
        window?.backgroundColor = .systemBackground
        window?.makeKeyAndVisible()
    }
    
}

