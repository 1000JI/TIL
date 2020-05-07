//
//  ViewController.swift
//  20200507-Practice-Storyboard-Segue
//
//  Created by 천지운 on 2020/05/07.
//  Copyright © 2020 jwcheon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var count: Int = 0
    
    // Show -> Show or Present로 동작
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func unwindToViewAController(for unwindSegue: UIStoryboardSegue, towards subsequentVC: UIViewController) {
        
        print("\n====================")
        print(unwindSegue.source)
        print(unwindSegue.destination)
        
        if let returnVC = unwindSegue.source as? SecondViewController {
            count = Int(returnVC.text)!
            
            if let intValue = Int(returnVC.textField.text ?? "0") {
                count += intValue
            }
        }
        
    }
    
    
    /*
     prepare(화면 전환에 따른 사전 작업하는 메서드)
     */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        print("\n====================")
        print(segue.source) // source 출발 View(화면이 전환되기 전)
        print(segue.destination) // destination 도착 View
        print(segue.identifier)
        
        guard let secondVC = segue.destination as? SecondViewController else { return }
        secondVC.text = "\(count)"
        
//        if let button = sender as? UIButton {
//            guard let secondVC = segue.destination as? SecondViewController else { return }
//
//            switch button.currentTitle {
//            case "FirstVC":
//                secondVC.text = "\(count + 1)"
//            case "SecondVC":
//                secondVC.text = "\(count + 10)"
//            case "ThirdVC":
//                secondVC.text = "\(count + 100)"
//            default:
//                secondVC.text = "\(count)"
//            }
//        }
        
//        guard let secondVC = segue.destination as? SecondViewController else { return }
//
//        secondVC.text = (sender as? UIButton)?.currentTitle ?? ""
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        super.shouldPerformSegue(withIdentifier: identifier, sender: sender)
        
        if let title = (sender as? UIButton)?.currentTitle {
            switch title {
            case "FirstVC":
                guard count + 1 <= 40 else { return false }
            case "SecondVC":
                guard count + 10 <= 40 else { return false }
            case "ThirdVC":
                guard count + 100 <= 40 else { return false }
            default:
                return false
            }
        }
        return true
    }
    
    @IBAction private func performManualSegue(_ sender: Any) {
        performSegue(withIdentifier: "FirstToSecond", sender: sender)
    }
}

