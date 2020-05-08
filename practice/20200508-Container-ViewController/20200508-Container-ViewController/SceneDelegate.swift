//
//  SceneDelegate.swift
//  20200508-Container-ViewController
//
//  Created by 천지운 on 2020/05/08.
//  Copyright © 2020 jwcheon. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
//        window?.rootViewController = UIViewController()

        // Navigation ---------------------------------------------
//        let vc = AViewController()
//        let navi = UINavigationController(rootViewController: vc)
//        navi.navigationController?.navigationBar.prefersLargeTitles = true
//        window?.rootViewController = navi
        
        // Tab bar Controller ---------------------------------------------
        let avc = AViewController()
        avc.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 0)
        
        let bvc = BViewController()
        bvc.tabBarItem = UITabBarItem(title: "Second", image: UIImage(systemName: "person.circle"), tag: 1)
        
        let cvc = CViewController()
        let navi = UINavigationController(rootViewController: cvc)
        navi.tabBarItem = UITabBarItem(tabBarSystemItem: .downloads, tag: 2)
        
        
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [avc, bvc, navi]
        window?.rootViewController = tabBarController
        
        
        //-----------------------------//
        window?.frame = UIScreen.main.bounds
        window?.backgroundColor = .systemOrange
        window?.makeKeyAndVisible()
        
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        
    }

    func sceneWillResignActive(_ scene: UIScene) {
        
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        
    }


}

