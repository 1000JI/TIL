//
//  SecondViewController.swift
//  UserDefaults
//
//  Created by 천지운 on 2020/05/08.
//  Copyright © 2020 giftbot. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    let myDB = UserDefaults.standard
    
    @IBOutlet private var image: UIImageView!
    @IBOutlet private var swit: UISwitch!
    
    private struct Key {
        static var animal = "animal"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        swit.addTarget(self, action: #selector(changedValue(_:)), for: .valueChanged)
        
        image.image = UIImage(named: myDB.string(forKey: Key.animal) ?? "cat")
        swit.isOn = myDB.bool(forKey: "switch")
    }
    
    @objc private func changedValue(_ sender: UISwitch) {
        if sender.isOn {
            image.image = UIImage(named: "dog")
            myDB.set("dog", forKey: Key.animal)
        } else {
            image.image = UIImage(named: "cat")
            myDB.set("cat", forKey: Key.animal)
        }
        myDB.set(sender.isOn, forKey: "switch")
    }
}
