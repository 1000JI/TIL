//
//  SaveData.swift
//  PhoneCallProject
//
//  Created by 천지운 on 2020/06/03.
//  Copyright © 2020 jwcheon. All rights reserved.
//

import Foundation

struct AppShared {
    static let phoneCallTitles = [("시각", "clock"), ("발신자","person")]
    static var phoneCallMenu = [
        "시각": "3 Seconds Later",
        "발신자": "홍길동"
    ]
    
    static let timeTitles = ["3 Seconds Later", "10 Seconds Later", "30 Seconds Later",
                             "1 Minute Later", "2 Minutes Later", "5 Minutes Later",
                             "8 Minutes Later", "12 Minutes Later", "20 Minutes Later",
                             "30 Minutes Later", "1 Hour Later"
    ]
    static let timesList = [
        "3 Seconds Later": 3,
        "10 Seconds Later": 10,
        "30 Seconds Later": 30,
        "1 Minute Later": 60,
        "2 Minutes Later": 60 * 2,
        "5 Minutes Later": 60 * 5,
        "8 Minutes Later": 60 * 8,
        "12 Minutes Later": 60 * 12,
        "20 Minutes Later": 60 * 20,
        "30 Minutes Later": 60 * 30,
        "1 Hour Later": 60 * 60
    ]
}
