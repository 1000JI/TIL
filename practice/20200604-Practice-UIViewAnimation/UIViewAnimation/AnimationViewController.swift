//
//  AnimationViewController.swift
//  UIViewAnimation
//
//  Created by giftbot on 2020. 6. 4..
//  Copyright © 2020년 giftbot. All rights reserved.
//

import UIKit

final class AnimationViewController: UIViewController {
    
    // MARK: - Properties
    
    @IBOutlet private weak var userIdTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var loginButton: UIButton!
    @IBOutlet private weak var activityIndicatorView: UIActivityIndicatorView!
    @IBOutlet private weak var countDownLabel: UILabel!
    
    var count = 4 {
        didSet { countDownLabel.text = "\(count)" }
    }
    
    // MARK: - View LifeCycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        userIdTextField.center.x = -view.frame.width
        passwordTextField.center.x = -view.frame.width
        loginButton.center.x = -view.frame.width
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 0.6) {
            self.userIdTextField.center.x = self.userIdTextField.superview!.bounds.midX
            print(self.userIdTextField.center.x) // 애니메이션 후 최종 값으로 출력 됨
        }
        
        UIView.animate(withDuration: 0.6, delay: 0.5, animations: {
            self.passwordTextField.center.x = self.passwordTextField.superview!.bounds.midX
        })
        
        UIView.animate(
            withDuration: 0.6,
            delay: 1,
            usingSpringWithDamping: 0.6, // 0에 가까울 수록 큰 진동
            initialSpringVelocity: 0, // 초기에 가해지는 힘
            options: [.autoreverse], // ease-in-out을 많이 씀, .autoreverse 왔다가 되돌아감
            animations: {
                self.loginButton.center.x = self.loginButton.superview!.bounds.midX
        }) { isFinished in
            print("isFinish : ", isFinished)
        }
    }
    
    // MARK: - Action Handler
    
    @IBAction private func didEndOnExit(_ sender: Any) {}
    
    @IBAction private func login(_ sender: Any) {
        loginButtonAnimation()
        countDown()
    }
    
    func addAnimateKeyframes() {
        UIView.animateKeyframes(
            withDuration: 4,
            delay: 0,
            animations: {
                UIView.addKeyframe(
                    withRelativeStartTime: 0, // 4 * 0 = 0
                    relativeDuration: 0.25 // 4 * 0.25 = 1
                ) {
                    self.loginButton.center.x += 100.0
                }
                
                UIView.addKeyframe(
                    withRelativeStartTime: 0.25, // 4 * 0.25 = 1
                    relativeDuration: 0.25 // 4 * 0.25 = 1
                ) {
                    self.loginButton.center.y += 100.0
                }
                
                UIView.addKeyframe(
                    withRelativeStartTime: 0.5, // 4 * 0.5 = 2
                    relativeDuration: 0.25 // 4 * 0.25 = 1
                ) {
                        self.loginButton.center.x -= 100.0
                }
                
                UIView.addKeyframe(
                    withRelativeStartTime: 0.75, // 4 * 0.75 = 3
                    relativeDuration: 0.25 // 4 * 0.25 = 1
                ) {
                        self.loginButton.center.y -= 100.0
                }
        })
    }
    
    func loginButtonAnimation() {
        activityIndicatorView.startAnimating()
        
        let centerOrigin = loginButton.center
        
        UIView.animateKeyframes(
            withDuration: 1.6,
            delay: 0,
            animations: {
                
                // 로그인 버튼을 0.4초 동안 우측 아래로 이동
                UIView.addKeyframe(
                    withRelativeStartTime: 0.0,
                    relativeDuration: 0.25) {
                        self.loginButton.center.x += 50
                        self.loginButton.center.y += 50
                }
                
                // 로그인 버튼을 0.4초 동안
                UIView.addKeyframe(
                    withRelativeStartTime: 0.25,
                    relativeDuration: 0.25) {
                        self.loginButton.transform = .init(rotationAngle: .pi / 4)
                        self.loginButton.center.x += 150
                        self.loginButton.center.y -= 70
                        self.loginButton.alpha = 0
                }
                
                UIView.addKeyframe(
                    withRelativeStartTime: 0.51,
                    relativeDuration: 0.01) {
                        self.loginButton.transform = .identity
                        self.loginButton.center = CGPoint(
                            x: centerOrigin.x,
                            y: self.loginButton.superview!.frame.height + 120
                        )
                }
                
                UIView.addKeyframe(
                    withRelativeStartTime: 0.75,
                    relativeDuration: 0.25) {
                        self.loginButton.alpha = 1.0
                        self.loginButton.center = centerOrigin
                }
        }) { (_) in
//            self.activityIndicatorView.stopAnimating()
        }
        
        // transform - 크기, 회전, 이동
//        self.loginButton.transform = .identity
        
//        self.loginButton.transform = .init(scaleX: 2, y: 2) // 크기
//        self.loginButton.transform = .init(rotationAngle: 90) // 회전
//        self.loginButton.transform = .init(translationX: 30, y: 30) // 이동
        
//        self.loginButton.transform = CGAffineTransform(translationX: 25, y: 25)
//        self.loginButton.transform = CGAffineTransform(translationX: -75, y: -75)
//        self.loginButton.transform = CGAffineTransform(rotationAngle: 180)
    }
    
    func countDown() {
        countDownLabel.isHidden = false
        
        // 메인 큐 - UI를 작업할 때
        // 글로벌 큐 - UI가 아닌 작업
        
        UIView.transition(
            with: self.countDownLabel,
            duration: 0.5, // 애니메이션 지속 시간
            options: [.transitionFlipFromRight],
            animations: {
                self.count -= 1
        }) { _ in
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                guard self.count == 0 else { return self.countDown() }
                self.count = 4
                self.countDownLabel.isHidden = true
                self.activityIndicatorView.stopAnimating()
            }
        }
    }
}
