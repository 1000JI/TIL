//
//  ViewController.swift
//  20200512-Practice-DelegateExample
//
//  Created by 천지운 on 2020/05/12.
//  Copyright © 2020 jwcheon. All rights reserved.
//

import UIKit

// 사용할 delegate(CustomViewDelegate)를 추가해줘야 한다.
// 1. delegate 프로토콜 채택
class ViewController: UIViewController, CustomViewDelegate {

    @IBOutlet var customView: CustomView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*
         2. delegate 프로퍼티를 소유한 객체에게 위임받아 처리할 메서드를 구현한 객체 할당(보통 self)
         - customView.delegate에 ViewController(주소)를 전달해줌
         - 이 부분이 중요함
         - 프로토콜을 채택하지 않은 경우 에러 메시지 발생
         */
        customView.delegate = self
        
        customView.backgroundColor = .systemRed
        customView.backgroundColor = .systemGreen
        customView.backgroundColor = nil
    }
    
    /*
     3. 채택한 프로토콜의 메서드 구현
     - CustomViewDelegate의 colorForBackground 구현 부분
     - 옵셔널 메서드인 경우 미구현 가능
     - 이 메서드가 언제 호출될 지는 결정할 수 없으며, 그 시점은 위임하는 객체에 달려있음
     */
    func colorForBackground(_ newColor: UIColor?) -> UIColor {
        guard let color = newColor else { return .systemGray }
        return color == .systemGreen ? .systemBlue : color
    }

    private func changeBackgroundColor() {
        let colors: [UIColor] = [.systemBlue, .systemRed, .systemGreen, .systemYellow]
        customView.backgroundColor = colors.randomElement()!
        print(customView.backgroundColor)
    }
}
    
