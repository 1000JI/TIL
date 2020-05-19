//
//  SceneDelegate.swift
//  20200519-MiniProj-MVC-Calculator
//
//  Created by 천지운 on 2020/05/19.
//  Copyright © 2020 jwcheon. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: windowScene)
        window?.backgroundColor = .systemBackground
        window?.frame = UIScreen.main.bounds
        window?.rootViewController = CalcController()
        window?.makeKeyAndVisible()
    }

}

