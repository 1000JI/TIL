//
//  ThirdViewController.swift
//  20200507-Practice-Animal-Count
//
//  Created by 천지운 on 2020/05/07.
//  Copyright © 2020 jwcheon. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
    
    @IBOutlet private var dogLabel: UILabel!
    @IBOutlet private var catLabel: UILabel!
    @IBOutlet private var birdLabel: UILabel!
    
    var dogCount: Int = 0 {
        didSet {
            dogLabel.text = "\(dogCount)"
        }
    }
    
    var catCount: Int = 0 {
        didSet {
            catLabel.text = "\(catCount)"
        }
    }
    
    var birdCount: Int = 0 {
        didSet {
            birdLabel.text = "\(birdCount)"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction private func performManualSegue(_ sender: Any) {
//        print(self.presentedViewController)
//        print(self.presentedViewController)
        
        guard let title = (sender as? UIButton)?.currentTitle else { return }
        
        switch title {
        case "Dog":
            guard dogCount < 8 else { return }
            performSegue(withIdentifier: "DogSegue2", sender: sender)
        case "Cat":
            guard catCount < 10 else { return }
            performSegue(withIdentifier: "CatSegue2", sender: sender)
        case "Bird":
            guard birdCount < 15 else { return }
            performSegue(withIdentifier: "BirdSegue2", sender: sender)
        default:
            return
        }
        
        if let vc = self.presentedViewController as? ForceViewController {
            switch title {
            case "Dog":
                vc.imageView.image = UIImage(named: "dog")
                dogCount += 1
            case "Cat":
                vc.imageView.image = UIImage(named: "cat")
                catCount += 1
            case "Bird":
                vc.imageView.image = UIImage(named: "bird")
                birdCount += 1
            default:
                return
            }
        }
    }
    
    @IBAction func unwindToViewController(for unwindSegue: UIStoryboardSegue, towards subsequentVC: UIViewController) {
        // CODE
    }

}
