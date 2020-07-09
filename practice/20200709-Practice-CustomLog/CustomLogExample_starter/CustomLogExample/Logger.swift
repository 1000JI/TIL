//
//  Logger.swift
//  CustomLogExample
//
//  Copyright © 2020 giftbot. All rights reserved.
//

import Foundation

class Formatter {
    static let date: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm:ss:SSS"
        return dateFormatter
    }()
}
