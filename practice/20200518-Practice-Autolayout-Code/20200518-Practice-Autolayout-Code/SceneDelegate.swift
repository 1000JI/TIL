//
//  SceneDelegate.swift
//  20200518-Practice-Autolayout-Code
//
//  Created by 천지운 on 2020/05/18.
//  Copyright © 2020 jwcheon. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        window = UIWindow(windowScene: windowScene)
        window?.backgroundColor = .systemBackground
        
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        window?.rootViewController = storyboard.instantiateViewController(identifier: "ViewController")
        
        window?.rootViewController = AutolayoutAnchorViewController()
        
//        window?.rootViewController = StackViewController()
        
        window?.frame = UIScreen.main.bounds
        window?.makeKeyAndVisible()
    }
}

