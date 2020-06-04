//
//  ReceiveCallViewController.swift
//  PhoneCallProject
//
//  Created by 천지운 on 2020/06/03.
//  Copyright © 2020 jwcheon. All rights reserved.
//

import UIKit

class ReceiveCallViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupLayout()
        setupPhoneCallReceive()
    }
    
    let callerView = CallerView()
    
    private func setupLayout() {
        callerView.frame = view.frame
        callerView.alpha = 0
        callerView.delegate = self
        
        view.addSubview(callerView)
    }
    
    private func setupPhoneCallReceive() {
        view.backgroundColor = .black
        DispatchQueue.main.asyncAfter(deadline: .now() + 0) {
            self.callerView.alpha = 1
        }
    }

}

extension ReceiveCallViewController: CallerViewDelegate {
    func callerViewDismiss() {
        self.view.window?.rootViewController?.dismiss(animated: true, completion: nil)
    }
}
