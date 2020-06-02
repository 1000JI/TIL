//
//  AppDelegate.swift
//  ImagePickerControllerExample
//
//  Created by giftbot on 2020. 6. 1..
//  Copyright © 2020년 giftbot. All rights reserved.
//

import UIKit

@UIApplicationMain
final class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func applicationDidFinishLaunching(_ application: UIApplication) {
        // 스토리보드 + SceneDelegate 안 쓸 때
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = PracticeViewController()
        window?.backgroundColor = .systemBackground
        window?.makeKeyAndVisible()
    }
}
