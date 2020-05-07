//
//  SecondViewController.swift
//  20200507-Practice-Animal-Count
//
//  Created by 천지운 on 2020/05/07.
//  Copyright © 2020 jwcheon. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    var image: UIImage = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imageView.image = image
    }
    
    @IBAction private func clickedCountUP(_ sender: UIButton) {
        if let callView = self.presentingViewController as? ViewController {
            callView.dogCount += callView.dogCount < 8 ? 1 : 0
            callView.catCount += callView.catCount < 10 ? 1 : 0
            callView.birdCount += callView.birdCount < 15 ? 1 : 0
        }
    }
    
}
