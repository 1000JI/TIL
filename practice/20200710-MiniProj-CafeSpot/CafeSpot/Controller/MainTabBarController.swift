//
//  MainTabBarController.swift
//  CafeSpot
//
//  Created by 천지운 on 2020/07/10.
//  Copyright © 2020 Giftbot. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    // MARK: - Properties
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTabBar()
    }
    
    // MARK: - Helpers
    
    func configureTabBar() {
        view.backgroundColor = .systemBackground
        
        let navHomeController = UINavigationController(rootViewController: HomeViewController(collectionViewLayout: UICollectionViewFlowLayout()))
        navHomeController.tabBarItem = UITabBarItem(
            title: "홈",
            image: UIImage(systemName: "house"),
            selectedImage: UIImage(systemName: "house.fill"))
        
        let searchController = SearchViewController()
        searchController.tabBarItem = UITabBarItem(
            title: "지도 검색",
            image: UIImage(systemName: "map"),
            selectedImage: UIImage(systemName: "map.fill"))
        
        viewControllers = [navHomeController, searchController]
    }
}
