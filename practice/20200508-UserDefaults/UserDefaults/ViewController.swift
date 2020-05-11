//
//  ViewController.swift
//  UserDefaults
//
//  Created by giftbot on 2020. 05. 06..
//  Copyright © 2020년 giftbot. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
    
    let myUserDefault = UserDefaults.standard
    
    @IBOutlet private weak var datePicker: UIDatePicker!
    @IBOutlet private weak var alertSwitch: UISwitch!
    
    private struct Key {
        static let today = "Today"
    }
    
    // MARK: Action Handler
    
    @IBAction func saveData(_ button: UIButton) {
        // UserDefaults를 이용해서 Alarm switch, DatePicker 값 저장
        
        myUserDefault.set(datePicker.date, forKey: "dateValue")
        myUserDefault.set(alertSwitch.isOn, forKey: "switchValue")
    }
    
    @IBAction func loadData(_ button: UIButton) {
        if let dateValue = myUserDefault.object(forKey: "dateValue") as? Date {
            datePicker.setDate(dateValue, animated: true)
        }
        
        alertSwitch.setOn(myUserDefault.bool(forKey: "switchValue"), animated: true)
    }
}

