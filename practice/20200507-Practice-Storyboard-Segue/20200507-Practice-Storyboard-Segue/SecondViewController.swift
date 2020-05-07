//
//  SecondViewController.swift
//  20200507-Practice-Storyboard-Segue
//
//  Created by 천지운 on 2020/05/07.
//  Copyright © 2020 jwcheon. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet private var textLabel: UILabel!
    @IBOutlet var textField: UITextField!
    var text = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        textLabel.text = text
    }
    
    @IBAction func unwindToViewBController(for unwindSegue: UIStoryboardSegue, towards subsequentVC: UIViewController) {
        
    }
}
