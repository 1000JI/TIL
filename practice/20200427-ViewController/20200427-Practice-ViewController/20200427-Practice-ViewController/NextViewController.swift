//
//  NextViewController.swift
//  20200427-Practice-ViewController
//
//  Created by 천지운 on 2020/04/27.
//  Copyright © 2020 jwcheon. All rights reserved.
//

import UIKit

class NextViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemIndigo
        
        let button = UIButton(type: .system)
        button.setTitle("Button", for: .normal)
        button.sizeToFit()
        button.center = view.center
        button.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
        view.addSubview(button)
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//      super.viewWillAppear(animated)
//      print("\n---------- [ viewWillAppear - next vc ] ----------\n")
//    }
//
//    override func viewDidAppear(_ animated: Bool) {
//      super.viewDidAppear(animated)
//      print("\n---------- [ viewDidAppear - next vc ] ----------\n")
//    }
//
//    override func viewWillDisappear(_ animated: Bool) {
//      super.viewWillDisappear(animated)
//      print("\n---------- [ viewWillDisappear - next vc ] ----------\n")
//    }
//
//    override func viewDidDisappear(_ animated: Bool) {
//      super.viewDidDisappear(animated)
//      print("\n---------- [ viewDidDisappear - next vc ] ----------\n")
//    }
//
//    deinit {
//        print("Deinitialized - Next View Controller")
//    }

    @objc private func didTapButton(_ sender: UIButton) {
        /*
         presentingViewController - 나를 띄운 ViewController
         presentedViewController - 내가 띄운 ViewController
         */
        
        // self: Next VC
        // self.presentingViewController // ViewController
        // self.presentingViewController.presentedViewController // Next VC
        
//        print("Next ViewController")
//        print(self.presentingViewController)
//        print(self.presentedViewController)
        
//        let colors: [UIColor] = [.systemPurple, .systemIndigo, .systemTeal, .systemRed]
//        self.presentingViewController?.view.backgroundColor = colors.randomElement()!
//
//        presentingViewController // UIViewController -> button(X)
        
        if let vc = self.presentingViewController as? ViewController {
            vc.button.setTitle("클릭's", for: .normal)
        }
        
//        dismiss(animated: true, completion: nil)
        
        // automatic으로 띄운 창을 닫을 수 있는 여부를 설정할 수 있음
        isModalInPresentation = !isModalInPresentation
        
        // A -> B -> C
        // C dismiss -> B
        // presentingViewController?.dismiss = dismiss
        // presentingViewController?.presentingViewController?.dismiss(animated: true)
        
        // 최상위 뷰를 찾을 때 사용 할 수 있음
        // UIApplication.shared.keyWindow?.rootViewController
    }
}
