//
//  OneViewController.swift
//  20200427-Practice-Third-AND-Counting
//
//  Created by 천지운 on 2020/04/27.
//  Copyright © 2020 jwcheon. All rights reserved.
//

/*
 문제: 3개의 뷰 컨트롤러 사이에 화면 전환하기
      A는 B로 가는 버튼
      B는 A로 돌아가는 dismiss 버튼과 C로 가는 버튼
      C는 A 또는 B로 돌아가는 dismiss 버튼

 (참고)
 A -> B
   <- B -> C
      B <- C
 A   <-    C
 */

import UIKit

class OneViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let topLabel = UILabel()
        topLabel.center = CGPoint(x: view.center.x, y: 100)
        topLabel.text = "A"
        topLabel.font = UIFont.boldSystemFont(ofSize: 35)
        topLabel.textAlignment = .center
        topLabel.sizeToFit()
        view.addSubview(topLabel)
        
        let button = UIButton(type: .system)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        button.setTitleColor(.black, for: .normal)
        button.setTitle("B로 이동", for: .normal)
        button.sizeToFit()
        button.center = view.center
        button.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
        view.addSubview(button)
    }

    @objc private func didTapButton(_ sender: UIButton) {
        let twoVC = TwoViewController()
        twoVC.modalPresentationStyle = .fullScreen
        self.present(twoVC, animated: true)
    }
}
