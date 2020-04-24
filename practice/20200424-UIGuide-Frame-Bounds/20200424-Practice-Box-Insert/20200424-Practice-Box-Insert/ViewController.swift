//
//  ViewController.swift
//  20200424-Practice-Box-Insert
//
//  Created by 천지운 on 2020/04/24.
//  Copyright © 2020 jwcheon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 방법 1
//        let box3View = boxViewSetup(superView: view, color: .black)
//        let box2View = boxViewSetup(superView: box3View, color: .systemPink)
//        let box1View = boxViewSetup(superView: box2View, color: .cyan)
        
        // 방법 2
        var presentView: UIView = view
        let colorSet : [UIColor] = [.black, .systemPink, .cyan]
        
        for color in colorSet {
            print(presentView.frame)
            presentView = boxViewSetup(superView: presentView, color: color)
        }
        
        // Root View Bounds에 30을 주면 View들이 좌측상단으로 올라감
//        view.bounds.origin = CGPoint(x: 0, y: 0)
        
        // Root View -> Subview frame.origin에 100을 주면 내려감
//        view.subviews.first!.frame.origin = CGPoint(x: 0, y: 0)
        
//        blueViewSetup(superView: view)
//        blueViewSetup2(superView: view)
//        blueViewSetup3(superView: view)
        // Do any additional setup after loading the view.
    }
    
    func boxViewSetup(superView: UIView, color: UIColor) -> UIView {
        let boxView = UIView()
        boxView.backgroundColor = color
        boxView.frame = CGRect(x: 30, y: 30, width: Int(superView.frame.size.width - 60), height: Int(superView.frame.size.height - 60))
        boxView.layer.masksToBounds = true
        boxView.layer.cornerRadius = boxView.frame.size.width / 2
        
        superView.addSubview(boxView)
        return boxView
    }
    
    func blueViewSetup(superView: UIView) -> UIView {
        let blueView = UIView()
        blueView.backgroundColor = .blue
        blueView.frame = CGRect(x: 15, y: 15, width: 345, height: 100)
        superView.addSubview(blueView)
        return blueView
    }
    
    func blueViewSetup2(superView: UIView) -> UIView {
        let blueView = UIView()
        blueView.backgroundColor = .blue
        blueView.frame = CGRect(x: 15, y: superView.frame.size.height - 115, width: 345, height: 100)
        superView.addSubview(blueView)
        return blueView
    }
    
    func blueViewSetup3(superView: UIView) -> UIView {
        let blueView = UIView()
        blueView.backgroundColor = .blue
        blueView.frame = CGRect(x: 15, y: 15, width: superView.frame.size.width - 30, height: 100)
        superView.addSubview(blueView)
        return blueView
    }

}

