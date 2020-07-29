//
//  Weather.swift
//  WeatherForecast
//
//  Created by 천지운 on 2020/07/22.
//  Copyright © 2020 Giftbot. All rights reserved.
//

import Foundation

enum WeatherType: String {
    case cloudy = "Clouds"
    case sunny = "Clear"
    case rainy = "Rain"
}

struct WeatherModel: Decodable {
    let dt: TimeInterval
    let name: String
    let weather: [Weather]
    let main: MainModel
    
    struct Weather: Decodable {
        let main: String
        let description: String
        let icon: String
    }
    
    struct MainModel: Decodable {
        let temp: Double
        let temp_min: Double
        let temp_max: Double
    }
}



struct WeatherData: Decodable {
    let cnt: Int
    let list: [WeatherList]
}

struct WeatherList: Decodable {
    let dt: TimeInterval
    let main: WeatherMain
    let weather: [WeatherInfo]

    struct WeatherMain: Decodable {
        let temp: Double
    }
    
    struct WeatherInfo: Decodable {
        let icon: String
    }
}

