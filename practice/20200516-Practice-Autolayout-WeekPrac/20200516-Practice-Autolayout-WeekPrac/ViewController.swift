//
//  ViewController.swift
//  20200516-Practice-Autolayout-WeekPrac
//
//  Created by 천지운 on 2020/05/16.
//  Copyright © 2020 jwcheon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let greenView: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        return view
    }()
    
    let yellowView: UIView = {
        let view = UIView()
        view.backgroundColor = .yellow
        return view
    }()
    
    let redView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }()
    
    let blueView: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        return view
    }()
    
    let blackView1: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        return view
    }()
    
    let blackView2: UIView = {
        let view = UIView()
        view.backgroundColor = .yellow
        return view
    }()
    
    let blackView3: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }()
    
    let blackView4: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        return view
    }()
    
    let blackView5: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        view.addSubview(greenView)
//        view.addSubview(yellowView)
//        view.addSubview(redView)
//        view.addSubview(blueView)
        
        view.addSubview(blackView1)
        view.addSubview(blackView2)
        view.addSubview(blackView3)
        view.addSubview(blackView4)
        view.addSubview(blackView5)
    }
    
    override func viewWillLayoutSubviews() {
        // View Version
//        let viewWidth = view.frame.size.width
//        let viewHeight = view.frame.size.height
//
//        let stripWidthView = view.frame.size.width - view.safeAreaInsets.left - view.safeAreaInsets.right
//        let stripHeightView = view.frame.size.height - view.safeAreaInsets.top - view.safeAreaInsets.bottom
        
        // 1-1) 과제(View만 구성하기)
//        greenView.frame = CGRect(
//            x: 0,
//            y: 0,
//            width: viewWidth / 2,
//            height: viewHeight / 2
//        )
//
//        yellowView.frame = CGRect(
//            origin: CGPoint(x: greenView.frame.maxX, y: 0),
//            size: greenView.frame.size
//        )
//
//        redView.frame = CGRect(
//            origin: CGPoint(x: 0, y: greenView.frame.maxY),
//            size: greenView.frame.size
//        )
//
//        blueView.frame = CGRect(
//            origin: CGPoint(x: greenView.frame.maxX, y: greenView.frame.maxY),
//            size: greenView.frame.size
//        )
        
        // 1-2) 과제(Safe Area 고려하여 구성하기)
//        greenView.frame = CGRect(x: view.safeAreaInsets.left,
//                                 y: view.safeAreaInsets.top,
//                                 width: stripWidthView / 2,
//                                 height: stripHeightView / 2
//        )
//
//        yellowView.frame = CGRect(
//            origin: CGPoint(x: greenView.frame.maxX, y: view.safeAreaInsets.top),
//            size: greenView.frame.size
//        )
//
//        redView.frame = CGRect(
//            origin: CGPoint(x: view.safeAreaInsets.left, y: greenView.frame.maxY),
//            size: greenView.frame.size
//        )
//
//        blueView.frame = CGRect(
//            origin: CGPoint(x: greenView.frame.maxX, y: greenView.frame.maxY),
//            size: greenView.frame.size
//        )
        
        
        /*
         2) 과제
         - 5개의 뷰를 생성하고 높이는 150으로 통일
         - Safe Area Top 과 60 의 거리
         - 가장 왼쪽의 뷰는 leading 20, 가장 오른쪽의 뷰는 trailing 20으로 설정하고 각 view 간의 거리는 8로 고정
         - 각 위치에서 오른쪽에 있는 뷰는 왼쪽 뷰 width 의 0.7배에서 해당 위치의 인덱스만큼 뺀 값을 width 값으로 지님

         예시)
         - 2번째 뷰의 width는 1번째 뷰 width의 0.7배보다 1 작게 설정
         - 3번째 뷰의 width는 2번째 뷰 width의 0.7배보다 2 작게 설정
         */
        
        let safeTopAddPadding = Int(60 + view.safeAreaInsets.top)
        let leadingPadding = Int(20 + view.safeAreaInsets.left)
        let trailingPadding = Int(20 + view.safeAreaInsets.right)
        
        let blackViewHeight = 150
        
        blackView1.frame = CGRect(
            x: leadingPadding,
            y: safeTopAddPadding,
            width: 150,
            height: blackViewHeight
        )
        
        blackView2.frame = CGRect(
            origin: CGPoint(x: Double(blackView1.frame.maxX) + 8, y: Double(safeTopAddPadding)),
            size: CGSize(width: Double(blackView1.frame.size.width) * 0.7, height: Double(blackViewHeight))
        )
        
        blackView3.frame = CGRect(
            origin: CGPoint(x: Double(blackView2.frame.maxX) + 8, y: Double(safeTopAddPadding)),
            size: CGSize(width: Double(blackView2.frame.size.width) * 0.7, height: Double(blackViewHeight))
        )
        
        blackView4.frame = CGRect(
            origin: CGPoint(x: Double(blackView3.frame.maxX) + 8, y: Double(safeTopAddPadding)),
            size: CGSize(width: Double(blackView3.frame.size.width) * 0.7, height: Double(blackViewHeight))
        )
        
        blackView5.frame = CGRect(
            origin: CGPoint(x: Double(blackView4.frame.maxX) + 8, y: Double(safeTopAddPadding)),
            size: CGSize(width: Double(blackView4.frame.size.width) * 0.7, height: Double(blackViewHeight))
        )
    }
}

