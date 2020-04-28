//
//  BViewController.swift
//  20200427-Practice-Third-AND-Counting
//
//  Created by 천지운 on 2020/04/27.
//  Copyright © 2020 jwcheon. All rights reserved.
//

import UIKit

class BViewController: UIViewController {

    var bViewCount: Int = 0
    let countLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.presentationController?.delegate = self
        
        view.backgroundColor = .systemIndigo

        let bCountLabel = UILabel()
        bCountLabel.font = UIFont.boldSystemFont(ofSize: 35)
        bCountLabel.textAlignment = .center
        bCountLabel.textColor = .black
        bCountLabel.center = CGPoint(x: view.center.x, y: 200)
        bCountLabel.text = "\(bViewCount)"
        bCountLabel.sizeToFit()
        view.addSubview(bCountLabel)
        
        let moveButton = UIButton(type: .system)
        moveButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        moveButton.setTitle("A로 이동", for: .normal)
        moveButton.setTitleColor(.black, for: .normal)
        moveButton.sizeToFit()
        moveButton.center = view.center
        moveButton.setTitleColor(.systemPink, for: .normal)
        moveButton.addTarget(self, action: #selector(clickedMoveA(_:)), for: .touchUpInside)
        view.addSubview(moveButton)
    }
    
    @objc private func clickedMoveA(_ sender: UIButton) {
        if let vc = self.presentingViewController as? AViewController {
            vc.aViewCount = bViewCount + 1
            vc.aCountLabel.text = "\(vc.aViewCount)"
            vc.aCountLabel.sizeToFit()
        }
        self.dismiss(animated: true, completion: nil)
    }
    

}

extension BViewController: UIAdaptivePresentationControllerDelegate {
    
    
    func presentationControllerWillDismiss(_ presentationController: UIPresentationController) {
        print("presentationControllerWillDismiss")

//        if let vc = self.presentingViewController as? AViewController {
//            vc.aViewCount = bViewCount + 1
//            vc.aCountLabel.text = "\(vc.aViewCount)"
//            vc.aCountLabel.sizeToFit()
//            print("execute11")
//        }
    }
    
    func presentationControllerDidDismiss(_ presentationController: UIPresentationController) {
        print("presentationControllerDidDismiss")
        
//        let vc = UIApplication.shared.keyWindow?.rootViewController as? AViewController
//        vc!.aViewCount = bViewCount + 1
//        vc!.aCountLabel.text = "\(vc!.aViewCount)"
//        vc!.aCountLabel.sizeToFit()

//        print(presentingViewController)
//        print(presentedViewController)
//        print("내가 띄운 뷰:", presentationController.presentedViewController)
//        print("나를 띄운 뷰:", presentationController.presentingViewController)
        
        if let vc = presentationController.presentingViewController as? AViewController {
            vc.aViewCount = bViewCount + 1
            vc.aCountLabel.text = "\(vc.aViewCount)"
            vc.aCountLabel.sizeToFit()
        }
        
        
    }
    
    func presentationControllerShouldDismiss(_ presentationController: UIPresentationController) -> Bool {
        print("presentationControllerShouldDismiss")
        return true
    }
    
    func presentationControllerDidAttemptToDismiss(_ presentationController: UIPresentationController) {
        print("presentationControllerDidAttemptToDismiss")
    }
}
