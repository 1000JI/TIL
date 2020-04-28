//
//  ViewController.swift
//  20200428-Practice-UIAlertControllerExample
//
//  Created by 천지운 on 2020/04/28.
//  Copyright © 2020 jwcheon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var count: Int = 0 {
        didSet {
            countingLabel.text = "\(count)"
            countingLabel.sizeToFit()
        }
    }
    let countingLabel = UILabel()
    let countingButton = UIButton()
    
    @IBOutlet var test: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        countingLabel.center = view.center
        countingLabel.font = .boldSystemFont(ofSize: 25)
        countingLabel.text = "0"
        countingLabel.textColor = .black
        countingLabel.sizeToFit()
        
        view.addSubview(countingLabel)
        
        countingButton.center = CGPoint(x: view.center.x, y: view.center.y - 50)
        countingButton.titleLabel?.font = .boldSystemFont(ofSize: 35)
        countingButton.setTitle("+", for: .normal)
        countingButton.setTitleColor(.systemRed, for: .normal)
        countingButton.sizeToFit()
        countingButton.addTarget(self, action: #selector(clickedAddButton(_:)), for: .touchUpInside)
        
        view.addSubview(countingButton)
    }
    
    @objc func clickedAddButton(_ sender: UIButton) {
        let alert = UIAlertController(title: "카운트 추가?", message: "", preferredStyle: .alert)
        
        alert.addTextField { textField in
            textField.placeholder = "정수 값 입력"
            textField.keyboardType = .numberPad
        }
        
        let addAction = UIAlertAction(title: "Add Count", style: .default, handler: { _ in
//            self.count += 1
            
            if let addCount = alert.textFields?.first {
                guard addCount.text != "" else { return }
                self.count += Int(addCount.text!)!
            }
        })
        
        let resetAction = UIAlertAction(title: "Reset", style: .destructive, handler: { _ in
            self.count = 0
        })
        
        let cancelAction = UIAlertAction(title: "cancel", style: .cancel, handler: nil)
        
        alert.addAction(addAction)
        alert.addAction(resetAction)
        alert.addAction(cancelAction)
        
        self.present(alert, animated: true)
    }

    @IBAction func showAlert(_ sender: UIButton) {
        let alertController = UIAlertController(title: "제목", message: "메시지", preferredStyle: .actionSheet)
        
        let okAction = UIAlertAction(title: "확인", style: .default, handler: { _ in
            print("ok~~")
        })
        
        let deleteAction = UIAlertAction(title: "삭제", style: .destructive, handler: { _ in
            print("delete")
        })
        
        let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler: { _ in
            print("no~~")
        })
        
        alertController.addAction(okAction)
        alertController.addAction(deleteAction)
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true)
    }
    
}

