//
//  AddViewController.swift
//  20200525-Practice-TableView
//
//  Created by 천지운 on 2020/05/25.
//  Copyright © 2020 jwcheon. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {

    @IBOutlet var tfAddItem: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func btnAddItem(_ sender: UIButton) {
        items.append(tfAddItem.text!) // 텍스트 입력 값을 추가한다.
        itemsImageFile.append("clock.png") // 지정된 이미지 파일을 추가한다.
        tfAddItem.text = ""
        _ = navigationController?.popViewController(animated: true)
    }
}
