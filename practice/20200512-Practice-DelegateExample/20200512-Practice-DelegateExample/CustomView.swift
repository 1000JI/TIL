//
//  CustomView.swift
//  20200512-Practice-DelegateExample
//
//  Created by 천지운 on 2020/05/12.
//  Copyright © 2020 jwcheon. All rights reserved.
//

import UIKit

// 1. 프로토콜 정의
protocol CustomViewDelegate: class {
    func colorForBackground(_ newColor: UIColor?) -> UIColor
}

final class CustomView: UIView {
    /*
     2. delegate 프로퍼티 선언
     - 일반적으로 delegate라고 명명
     - 타입은 정의한 프로토콜과 동일
     - optional
     - weak : 순환 참조 때문에 weak으로 선언해야 한다
     */
    weak var delegate: CustomViewDelegate?
    
    override var backgroundColor: UIColor? {
        get { super.backgroundColor }
        set {
            /*
             3. 필요한 곳에서 delegate 객체의 메서드 실행
             - delegate에 할당된 객체는 없을 수 있음(nil)
             - nil이 아니면 메서드 호출에 응답하여 어떤 로직(그게 무엇이 될지는 알 수 없음)을 수행
             - 반환되는 값이 있을 경우 그 결과를 받아서 활용
             */
            let newColor = delegate?.colorForBackground(newValue)
            let applyColor = newColor ?? newValue ?? .systemGray
            
            super.backgroundColor = applyColor
            print("새로 변경될 색은 :", applyColor)
        }
    }
}
