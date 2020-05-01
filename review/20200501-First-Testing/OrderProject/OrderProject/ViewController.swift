//
//  ViewController.swift
//  OrderProject
//
//  Created by 천지운 on 2020/05/01.
//  Copyright © 2020 jwcheon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // Story Board
    @IBOutlet var orderView: UIView!
    
    @IBOutlet var jjajangCountLabel: UILabel!
    @IBOutlet var jjambbongCountLabel: UILabel!
    @IBOutlet var tangCountLabel: UILabel!
    
    let jjaPrice = 5000     // 짜장 가격
    let jjamPrice = 6000    // 짬뽕 가격
    let tangPrice = 12000   // 탕수육 가격
    
    // 각 수량 변수
    var jjajangCount: Int   = 0 {
        didSet {
            jjajangCountLabel.text = "\(jjajangCount)"
            paymentMoney = calcPrice()
        }
    }
    var jjamBbongCount: Int = 0 {
        didSet {
            jjambbongCountLabel.text = "\(jjamBbongCount)"
            paymentMoney = calcPrice()
        }
    }
    var tangCount: Int      = 0 {
        didSet {
            tangCountLabel.text = "\(tangCount)"
            paymentMoney = calcPrice()
        }
    }
    
    // 현재 결제 금액 계산하는 메소드
    private func calcPrice() -> Int {
        return (jjajangCount * jjaPrice) + (jjamBbongCount * jjamPrice) + (tangCount * tangPrice)
    }
    
    
    // 소지금 변수
    var remainMoney: Int = 70000 {
        didSet {
            myReadyMoneyLabel.text = "\(remainMoney)원"
        }
    }
    
    // 결제 금액 변수
    var paymentMoney: Int = 0 {
        didSet {
            paymentLabel.text = "\(paymentMoney)원"
        }
    }
    
    // Code
    let balanceView = UIView()
    
    let titleReadyMoneyLabel = UILabel()
    let myReadyMoneyLabel = UILabel()
    
    let titlePaymentLabel = UILabel()
    let paymentLabel = UILabel()
    
    let resetButton = UIButton(type: .system)
    let paymentButton = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        balanceViewSetting()
    }
    
    // 초기화 버튼 클릭시 초기화
    @objc private func clickedInit(_ sender: UIButton) {
        initMoney(false)
    }
    
    // 결제 버튼 클릭 시
    @objc private func clickedPayment(_ sender: UIButton) {
        let alert = UIAlertController(title: "결제하기", message: "총 결제금액은 \(paymentMoney)원 입니다.", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "확인", style: .default, handler: { ACTION in
            if self.remainMoney < self.paymentMoney {
                let refusalAlert = UIAlertController(title: "결제 취소", message: "소지금이 부족합니다.", preferredStyle: .alert)
                refusalAlert.addAction(UIAlertAction(title: "확인", style: .default, handler: nil))
                self.initMoney(true)
                
                self.present(refusalAlert, animated: true)
            } else {
                self.remainMoney -= self.paymentMoney
                self.initMoney(true)
            }
        })
        
        let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        
        self.present(alert, animated: true)
    }
    
    private func initMoney(_ isPayment: Bool) {
        // true면 결제했을 경우 초기화, false면 모두 초기화
        jjajangCount = 0
        jjamBbongCount = 0
        tangCount = 0
        paymentMoney = 0
        
        if !isPayment {
            remainMoney = 70000
        }
    }
    
    private func balanceViewSetting() {
        // View Setting
        balanceView.frame = CGRect(x: 20, y: Int(orderView.frame.size.width) + 70, width: Int(orderView.frame.size.width), height: 90)
        balanceView.backgroundColor = .white
        
        view.addSubview(balanceView)
        
        titleReadyMoneyLabel.frame = CGRect(x: 0, y: 0, width: 80, height: 40)
        titleReadyMoneyLabel.text = "소지금"
        titleReadyMoneyLabel.backgroundColor = .systemGreen
        titleReadyMoneyLabel.font = .boldSystemFont(ofSize: 20)
        titleReadyMoneyLabel.textAlignment = .center
        balanceView.addSubview(titleReadyMoneyLabel)
        
        myReadyMoneyLabel.frame = CGRect(x: titleReadyMoneyLabel.frame.size.width + 10, y: 0, width: 140, height: 40)
        myReadyMoneyLabel.text = "70000원"
        myReadyMoneyLabel.backgroundColor = .systemGreen
        myReadyMoneyLabel.font = .boldSystemFont(ofSize: 20)
        myReadyMoneyLabel.textAlignment = .right
        balanceView.addSubview(myReadyMoneyLabel)
        
        resetButton.frame = CGRect(x: balanceView.frame.width - 80, y: 0, width: 80, height: 40)
        resetButton.setTitle("초기화", for: .normal)
        resetButton.setTitleColor(.white, for: .normal)
        resetButton.backgroundColor = .black
        resetButton.titleLabel?.font = .boldSystemFont(ofSize: 20)
        resetButton.addTarget(self, action: #selector(clickedInit(_:)), for: .touchUpInside)
        balanceView.addSubview(resetButton)
        
        titlePaymentLabel.frame = CGRect(x: 0, y: balanceView.frame.size.height - 40, width: 80, height: 40)
        titlePaymentLabel.text = "결제금액"
        titlePaymentLabel.backgroundColor = .systemGreen
        titlePaymentLabel.font = .boldSystemFont(ofSize: 20)
        titlePaymentLabel.textAlignment = .center
        balanceView.addSubview(titlePaymentLabel)
        
        paymentLabel.frame = CGRect(x: titlePaymentLabel.frame.size.width + 10, y: balanceView.frame.size.height - 40, width: 140, height: 40)
        paymentLabel.text = "0원"
        paymentLabel.backgroundColor = .systemGreen
        paymentLabel.font = .boldSystemFont(ofSize: 20)
        paymentLabel.textAlignment = .right
        balanceView.addSubview(paymentLabel)
        
        paymentButton.frame = CGRect(x: balanceView.frame.width - 80, y: balanceView.frame.size.height - 40, width: 80, height: 40)
        paymentButton.setTitle("결제", for: .normal)
        paymentButton.setTitleColor(.white, for: .normal)
        paymentButton.backgroundColor = .black
        paymentButton.titleLabel?.font = .boldSystemFont(ofSize: 20)
        paymentButton.addTarget(self, action: #selector(clickedPayment(_:)), for: .touchUpInside)
        balanceView.addSubview(paymentButton)
    }

    @IBAction func clickedJjajang(_ sender: UIButton) {
        jjajangCount += 1
    }
    
    @IBAction func clickedJjam(_ sender: UIButton) {
        jjamBbongCount += 1
    }
    
    @IBAction func clickedTang(_ sender: UIButton) {
        tangCount += 1
    }
    
}

