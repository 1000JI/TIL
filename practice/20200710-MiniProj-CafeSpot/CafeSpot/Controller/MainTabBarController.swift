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
        
        let controller = HomeViewController(collectionViewLayout: HomeViewCustomLayout())

        controller.collectionView.contentInset = .init(top: 12, left: 12, bottom: 12, right: 12)
        let layout = controller.collectionView.collectionViewLayout
        if let layout = layout as? HomeViewCustomLayout {
            layout.delegate = controller
        }
//        let controller = HomeViewController(collectionViewLayout: UICollectionViewFlowLayout())
        
        let navHomeController = UINavigationController(rootViewController: controller)
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
