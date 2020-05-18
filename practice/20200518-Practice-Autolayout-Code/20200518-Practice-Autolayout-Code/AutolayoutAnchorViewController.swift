//
//  AutolayoutAnchorViewController.swift
//  20200518-Practice-Autolayout-Code
//
//  Created by 천지운 on 2020/05/18.
//  Copyright © 2020 jwcheon. All rights reserved.
//

import UIKit

class AutolayoutAnchorViewController: UIViewController {

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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        autolayoutView()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
    }
    
    func autolayoutView() {
        let safeTopLength       : CGFloat = 20
        let safeBottomLength    : CGFloat = 20
        let safeLeftLength      : CGFloat = 20
        let safeRightLength     : CGFloat = 20
        let viewBetweenLength   : CGFloat = 10
        
        view.addSubview(redView)
        view.addSubview(blueView)
        
        redView.translatesAutoresizingMaskIntoConstraints = false
        blueView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            redView.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor,
                constant: safeTopLength
            ),
            redView.leadingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.leadingAnchor,
                constant: safeLeftLength
            ),
            redView.bottomAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.bottomAnchor,
                constant: -safeBottomLength
            ),
            redView.trailingAnchor.constraint(
                equalTo: blueView.leadingAnchor,
                constant: -viewBetweenLength
            ),
            redView.widthAnchor.constraint(
                equalTo: blueView.widthAnchor
            )
        ])
        
        NSLayoutConstraint.activate([
            blueView.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor,
                constant: safeTopLength
            ),
            blueView.bottomAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.bottomAnchor,
                constant: -safeBottomLength
            ),
            blueView.trailingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.trailingAnchor,
                constant: -safeRightLength
            )
        ])
    }
}
