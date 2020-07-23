//
//  WeatherCellViewModel.swift
//  WeatherForecast
//
//  Created by 천지운 on 2020/07/22.
//  Copyright © 2020 Giftbot. All rights reserved.
//

import Foundation

struct WeatherCellViewModel {
    let weather: WeatherList
    
    private var dateValue: Date {
        return Date(timeIntervalSince1970: weather.dt)
    }
    
    var dateText: String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko_KR")
        formatter.dateFormat = "M.d (E)"
        return formatter.string(from: dateValue)
    }
    
    var timeText: String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko_KR")
        formatter.dateFormat = "HH:mm"
        return formatter.string(from: dateValue)
    }
    
    var iconName: String {
        return weather.weather[0].icon
    }
    
    var tempText: String {
        return String(format: "%02.0f°", weather.main.temp)
    }
}
