//
//  DetailViewController.swift
//  20200525-Practice-TableView
//
//  Created by 천지운 on 2020/05/25.
//  Copyright © 2020 jwcheon. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    // 텍스트를 저장할 변수
    var receiveItem = ""
    
    // DetailView의 Label을 선언한 변수
    @IBOutlet var lblItem: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        lblItem.text = receiveItem
    }
    
    // item 변수에 입력된 내용을 receiveItem에 할당받는다.
    func receiveitem(_ item: String) {
        receiveItem = item
    }
}
