//
//  ViewController.swift
//  20200427-Practice-ViewController
//
//  Created by 천지운 on 2020/04/27.
//  Copyright © 2020 jwcheon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

//    viewDidLoad - 만들어져서 메모리에 올라갈 때 1회 호출
    let button = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        button.setTitle("Button", for: .normal)
        button.titleLabel?.font = UIFont.preferredFont(forTextStyle: .title2)
        button.setTitleColor(.black, for: .normal)
        button.sizeToFit()  // 화면 크기에 맞춰 조절 됨
        button.center = view.center
        button.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
        view.addSubview(button)
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//      super.viewWillAppear(animated)
//      print("\n---------- [ viewWillAppear - view vc ] ----------\n")
//    }
//
//    override func viewDidAppear(_ animated: Bool) {
//      super.viewDidAppear(animated)
//      print("\n---------- [ viewDidAppear - view vc ] ----------\n")
//    }
//
//    override func viewWillDisappear(_ animated: Bool) {
//      super.viewWillDisappear(animated)
//      print("\n---------- [ viewWillDisappear - view vc ] ----------\n")
//    }
//
//    override func viewDidDisappear(_ animated: Bool) {
//      super.viewDidDisappear(animated)
//      print("\n---------- [ viewDidDisappear - view vc ] ----------\n")
//    }
//
//    deinit {
//        print("Deinitialized - View Controller")
//    }
    
    @objc private func didTapButton(_ sender: UIButton) {
        let nextVC = NextViewController()
        if #available(iOS 13.0, *) {
            nextVC.isModalInPresentation = true
        } else {
            // Fallback on earlier versions
        }
        
//        nextVC.modalPresentationStyle = .automatic
        
        nextVC.view.backgroundColor = .lightGray
        present(nextVC, animated: true)
    }

}

