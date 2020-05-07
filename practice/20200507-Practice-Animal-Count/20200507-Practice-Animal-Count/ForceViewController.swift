//
//  ForceViewController.swift
//  20200507-Practice-Animal-Count
//
//  Created by 천지운 on 2020/05/07.
//  Copyright © 2020 jwcheon. All rights reserved.
//

import UIKit

class ForceViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    var image: UIImage = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction private func clickedCountAddition(_ sender: UIButton) {
        if let vc = self.presentingViewController as? ThirdViewController {
            vc.dogCount += 1
            vc.catCount += 1
            vc.birdCount += 1
        }
    }

}
