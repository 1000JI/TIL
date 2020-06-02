//
//  SceneDelegate.swift
//  Dominos11_Starter
//
//  Created by Lee on 2020/05/26.
//  Copyright © 2020 Kira. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        
        let mainTabBarController = UITabBarController()
        
        let categoryNavi = UINavigationController(rootViewController: CategoryViewController())
        let categoryTabItem = UITabBarItem(title: "Domino's", image: UIImage(named: "domino's"), tag: 0)
        categoryNavi.tabBarItem = categoryTabItem
        
        let wishListViewNavi = UINavigationController(rootViewController: WishListViewController())
        let wishListTabItem = UITabBarItem(title: "Wish List", image: UIImage(named: "wishlist"), tag: 1)
        wishListViewNavi.tabBarItem = wishListTabItem
        
        mainTabBarController.setViewControllers([categoryNavi,wishListViewNavi], animated: true)
        
        window?.rootViewController = mainTabBarController
        window?.frame = UIScreen.main.bounds
        window?.backgroundColor = .systemBackground
        window?.makeKeyAndVisible()
    }
    
    
}

