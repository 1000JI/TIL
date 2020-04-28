//
//  AViewController.swift
//  20200427-Practice-Third-AND-Counting
//
//  Created by 천지운 on 2020/04/27.
//  Copyright © 2020 jwcheon. All rights reserved.
//

/*
 [ 과제 ]
 1. ViewController 데이터 전달
   > AViewController 와 BViewController 를 만든 뒤, 각각 하나씩의 Label 생성
   > A에서 B로 화면을 넘어갈 때는 B의 Label 값이 이전 값에서 +3 증가
   > B에서 A로 화면을 넘어갈 때는 A의 Label 값이 이전 값에서 +1 증가
     e.g. A에서 B로 갈 때 3, B에서 다시 A로 넘어올 때 4, 다시 A에서 B로 가면 7, 다시 A로 오면 8
 
 [ 도전 과제 ]
 1, 카드 스타일에서 제스처로 내릴 때는 UIAdaptivePresentationControllerDelegate 프로토콜을 사용한 별도의 작업 필요. 관련 내용을 검색해보고 presentationControllerDidDismiss 메서드를 이용해서 구현해보기
 */

import UIKit

class AViewController: UIViewController {

    var aViewCount: Int = 0
    let aCountLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemGray3
        
        aCountLabel.font = UIFont.boldSystemFont(ofSize: 35)
        aCountLabel.textAlignment = .center
        aCountLabel.textColor = .black
        aCountLabel.center = CGPoint(x: view.center.x, y: 200)
        aCountLabel.text = "0"
        aCountLabel.sizeToFit()
        view.addSubview(aCountLabel)
        
        let moveButton = UIButton(type: .system)
        moveButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        moveButton.setTitle("B로 이동", for: .normal)
        moveButton.setTitleColor(.black, for: .normal)
        moveButton.sizeToFit()
        moveButton.center = view.center
        moveButton.setTitleColor(.systemPink, for: .normal)
        moveButton.addTarget(self, action: #selector(clickedMoveB(_:)), for: .touchUpInside)
        view.addSubview(moveButton)
    }
    
    @objc private func clickedMoveB(_ sender: UIButton) {
        let BVC = BViewController()
        BVC.modalPresentationStyle = .automatic
        BVC.bViewCount = aViewCount + 3
    
        self.present(BVC, animated: true)
    }

}
