//
//  HeaderViewModel.swift
//  WeatherForecast
//
//  Created by 천지운 on 2020/07/22.
//  Copyright © 2020 Giftbot. All rights reserved.
//

import Foundation

struct HeaderViewModel {
    let presentWeather: WeatherModel
    
    var tempMinText: String {
        return "⤓ \(presentWeather.main.temp_min)°"
    }
    
    var tempMaxText: String {
        return "⤒ \(presentWeather.main.temp_max)°"
    }
    
    var tempPresentText: String {
        return String(format: "%02.1f°", presentWeather.main.temp)
    }
}
