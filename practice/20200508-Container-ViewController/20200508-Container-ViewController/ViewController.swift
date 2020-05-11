//
//  ViewController.swift
//  20200508-Container-ViewController
//
//  Created by 천지운 on 2020/05/08.
//  Copyright © 2020 jwcheon. All rights reserved.
//

import UIKit

/*
 prefers Large Title -> 네비게이션 상단 바가 크게 변함
 이어 받는 navigation view에서 Large Title을 Naver로 설정하여 설정을 막는 방법도 있음
*/

class ViewController: UIViewController {

    // let barButton으로 구성하면 버튼을 눌러도 사용되지 않는다. 왜냐하면 아직 self가 구성되어지기 전에 barButtonItem을 구성하기 때문이다. 따라서 lazy를 붙여서 self 구성 후 barButtonItem을 사용할 수 있도록 lazy을 붙여줘야 한다
    
    lazy var barButtonItem = UIBarButtonItem(title: "Next", style: .plain, target: self, action: #selector(pushViewController(_:)))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "FirstVC"
        self.navigationItem.title = "FirstVC2"
        
        if #available(iOS 11, *) {
            navigationController?.navigationBar.prefersLargeTitles = true
//            navigationItem.largeTitleDisplayMode = .never
        }
        
        let barButtonItem2 = UIBarButtonItem(title: "Next2", style: .plain, target: self, action: #selector(pushViewController(_:)))
        barButtonItem2.tintColor = .black
        
        let barButtonItem3 = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(pushViewController(_:)))
        
        self.navigationItem.rightBarButtonItems = [barButtonItem, barButtonItem2, barButtonItem3]
    }
    
    @objc private func pushViewController(_ sender: Any) {
        let secondVC = SecondViewController()
//        navigationController?.pushViewController(secondVC, animated: true)
        show(secondVC, sender: sender)
    }

}

