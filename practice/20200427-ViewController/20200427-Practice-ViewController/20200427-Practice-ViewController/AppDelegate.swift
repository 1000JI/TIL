//
//  AppDelegate.swift
//  20200427-Practice-ViewController
//
//  Created by 천지운 on 2020/04/27.
//  Copyright © 2020 jwcheon. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        if #available(iOS 13, *) {
            
        } else {
            // 스토리보드 + SceneDelegate 안 쓸 때
            window = UIWindow(frame: UIScreen.main.bounds)
            window?.rootViewController = ViewController()
            window?.backgroundColor = .systemTeal
            window?.makeKeyAndVisible()
        }
        
        return true
    }

    // MARK: UISceneSession Lifecycle
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        
    }


}

