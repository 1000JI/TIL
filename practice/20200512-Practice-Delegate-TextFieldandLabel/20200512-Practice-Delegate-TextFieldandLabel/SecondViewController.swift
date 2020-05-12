//
//  SecondViewController.swift
//  20200512-Practice-Delegate-TextFieldandLabel
//
//  Created by 천지운 on 2020/05/12.
//  Copyright © 2020 jwcheon. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    let viewLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        viewLabel.frame.size = CGSize(width: 200, height: 50)
        viewLabel.center = view.center
        viewLabel.backgroundColor = .systemFill
        viewLabel.font = .boldSystemFont(ofSize: 25)
        
        view.addSubview(viewLabel)
    }
}

extension SecondViewController: RiffleDelegate {
    func nextViewNextRiffle(_ inputText: String) {
        viewLabel.text = inputText
    }
}
