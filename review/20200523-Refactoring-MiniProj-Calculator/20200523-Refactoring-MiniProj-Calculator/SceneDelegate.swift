//
//  SceneDelegate.swift
//  20200523-Refactoring-MiniProj-Calculator
//
//  Created by 천지운 on 2020/05/23.
//  Copyright © 2020 jwcheon. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: windowScene)
        window?.frame = UIScreen.main.bounds
        window?.backgroundColor = .systemBackground
//        window?.rootViewController = CalcViewController()
        window?.rootViewController = ReCalcViewController()
        window?.makeKeyAndVisible()
    }
    
}

