//
//  ViewController.swift
//  20200515-Practice-Autolayout-Code
//
//  Created by 천지운 on 2020/05/15.
//  Copyright © 2020 jwcheon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let view1: UIView = {
        let view = UIView()
        view.backgroundColor = .systemRed
        return view
    }()
    
    let view2: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBlue
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad", view.safeAreaInsets)
        // viewDidLoad UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0)
        
        view.addSubview(view1)
        view.addSubview(view2)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear", view.safeAreaInsets)
        // viewWillAppear UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("viewDidAppear", view.safeAreaInsets)
        // viewSafeAreaInsetsDidChange UIEdgeInsets(top: 44.0, left: 0.0, bottom: 34.0, right: 0.0)
        // 44 -> 시계까지의 길이, 34 -> 바닥의 길이
        
//        drawBox()
    }
    
    override func viewSafeAreaInsetsDidChange() {
        super.viewSafeAreaInsetsDidChange()
        print("viewSafeAreaInsetsDidChange", view.safeAreaInsets)
        // viewDidAppear UIEdgeInsets(top: 44.0, left: 0.0, bottom: 34.0, right: 0.0)
        // 화면 돌릴 때 마다 호출 됨
//        drawBox()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        print("viewWillLayoutSubviews", view.safeAreaInsets)
        drawBox()
    }
    
    func drawBox() {
//        let safeAreaTop     = Int(view.safeAreaInsets.top)
//        let safeAreaBottom  = Int(view.safeAreaInsets.bottom)
//        let safeAreaLeft    = Int(view.safeAreaInsets.left)
//        let safeAreaRight   = Int(view.safeAreaInsets.right)
//        let viewWidth       = Int(view.frame.size.width)
//        let viewHeight      = Int(view.frame.size.height)
//        let defaultPadding      = 20
//        let viewBetweenPadding  = 10
//
//
//        let stripSafeRowSize = viewWidth - safeAreaLeft - safeAreaRight
//        let stripSafeColSize = viewHeight - safeAreaTop - safeAreaBottom
//        let rowPadding = defaultPadding + viewBetweenPadding / 2
//        let colPadding = defaultPadding * 2
//        let topPadding = safeAreaTop + defaultPadding
//
//        view1.frame = CGRect(
//            x: defaultPadding + safeAreaLeft,
//            y: topPadding,
//            width:  stripSafeRowSize / 2 - rowPadding,
//            height: stripSafeColSize - colPadding)
//
//        view2.frame = CGRect(
//            x: viewWidth / 2 + viewBetweenPadding / 2,
//            y: topPadding,
//            width:  stripSafeRowSize / 2 - rowPadding,
//            height: stripSafeColSize - colPadding)
        
        
        let margin: CGFloat = 20
        let padding: CGFloat = 10
        let safeLayoutInsets = view.safeAreaInsets
        let horizontalInset = safeLayoutInsets.left + safeLayoutInsets.right
        
        let yOffset = safeLayoutInsets.top + margin
        let viewWidth = (view.frame.width - padding - horizontalInset) / 2 - margin
        
        view1.frame = CGRect(
            x: safeLayoutInsets.left + margin,
            y: yOffset,
            width: viewWidth,
            height: view.bounds.height - yOffset - (safeLayoutInsets.bottom + margin)
        )
        
        view2.frame = CGRect(
            origin: CGPoint(x: view1.frame.maxX + padding, y: yOffset),
            size: view1.bounds.size
        )
//        print(view1.bounds.size) // == view1.frame.size
    }
}

