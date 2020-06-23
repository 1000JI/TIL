//
//  AppDelegate.swift
//  SlackNewWorkspaceUI
//
//  Copyright © 2020 giftbot. All rights reserved.
//

import UIKit

@UIApplicationMain
final class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    setupKeyWindow()
    return true
  }
  
  func setupKeyWindow() {
    window = UIWindow(frame: UIScreen.main.bounds)
    window?.backgroundColor = .systemBackground
    window?.rootViewController = CreateNewWSViewController()
    window?.makeKeyAndVisible()
  }
}
