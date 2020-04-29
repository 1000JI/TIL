//
//  ViewController.swift
//  20200429-Practice-Alert-Controller-Alike
//
//  Created by 천지운 on 2020/04/29.
//  Copyright © 2020 jwcheon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let viewLabel = UILabel()
    let alertButton = UIButton(type: .system)
    
    var content = "Display" {
        didSet {
            viewLabel.text = content
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        viewLabel.backgroundColor = .black
        viewLabel.textColor = .white
        viewLabel.font = .boldSystemFont(ofSize: 20)
        viewLabel.text = content
        viewLabel.textAlignment = .center

//        viewLabel.frame = CGRect(x: view.center.x - 100, y: 200, width: 200, height: 50)
        
        viewLabel.frame.size = CGSize(width: 200, height: 50)
        viewLabel.center = CGPoint(x: view.center.x, y: 200)
        
        view.addSubview(viewLabel)
        
        alertButton.backgroundColor = .systemBlue
        alertButton.setTitle("Next", for: .normal)
        alertButton.setTitleColor(.white, for: .normal)
        alertButton.titleLabel?.font = .boldSystemFont(ofSize: 20)
        alertButton.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
        alertButton.center = CGPoint(x: view.center.x, y: 500)
        alertButton.addTarget(self, action: #selector(clickedAlertButton(_:)), for: .touchUpInside)
        
        view.addSubview(alertButton)
    }

    @objc private func clickedAlertButton(_ sender: UIButton) {
//        let alert = UIAlertController(title: "입력", message: "", preferredStyle: .alert)
//
//        alert.addTextField { TextField in
//            TextField.textAlignment = .center
//        }
//
//        let okAction = UIAlertAction(title: "확인", style: .default, handler: { _ in
//            self.viewLabel.text = alert.textFields?[0].text
//        })
//
//        let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler: nil)
//
//        alert.addAction(okAction)
//        alert.addAction(cancelAction)
//
//        self.present(alert, animated: true)
        
        let vc = AlertViewController()
        
        vc.modalPresentationStyle = .overFullScreen
        
        self.present(vc, animated: false)
    }

}

