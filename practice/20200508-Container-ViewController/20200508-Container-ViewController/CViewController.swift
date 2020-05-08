//
//  CViewController.swift
//  20200508-Container-ViewController
//
//  Created by 천지운 on 2020/05/08.
//  Copyright © 2020 jwcheon. All rights reserved.
//

import UIKit

class CViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemOrange
        
        self.title = "C ViewController"
        
        let nextBarButton = UIBarButtonItem(title: "Next", style: .plain, target: self, action: #selector(clickedNextView(_:)))
        
        self.navigationItem.rightBarButtonItem = nextBarButton
        
//        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    @objc private func clickedNextView(_ sender: Any) {
        let vc = UIViewController()
        
        vc.view.backgroundColor = .systemGray
        
        self.navigationController?.pushViewController(vc, animated: true)
    }

}
