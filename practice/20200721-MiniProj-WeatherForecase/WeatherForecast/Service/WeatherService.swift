//
//  WeatherService.swift
//  WeatherForecast
//
//  Created by 천지운 on 2020/07/22.
//  Copyright © 2020 Giftbot. All rights reserved.
//

import Foundation

struct WeatherService {
    static let shared = WeatherService()
    private init () { }
    
    private let jsonDecoder = JSONDecoder()
    
    func fetchCurrentWeather(completion: @escaping(WeatherModel) -> Void) {
        let cityName = "seoul".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        
        guard let weatherURL = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(cityName)&appid=\(PrivateFile.weatherAppKey)&lang=kr&units=metric") else { return }
        
        let dataTask = URLSession.shared.dataTask(with: weatherURL) { (data, response, err) in
            guard err == nil else { return print(err!.localizedDescription)}
            guard let response = response as? HTTPURLResponse,
                (200..<400).contains(response.statusCode) else {
                    return print("Invalid response") }
            guard let data = data else { return }
            
            if let decodeData = try? self.jsonDecoder.decode(WeatherModel.self, from: data) {
                completion(decodeData)
            }
        }
        dataTask.resume()
    }
    
    func fetchFiveDayThreeHourWeather(completion: @escaping(WeatherData) -> Void) {
        let cityName = "seoul".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        
        guard let weatherURL = URL(string: "https://api.openweathermap.org/data/2.5/forecast?q=\(cityName)&appid=\(PrivateFile.weatherAppKey)&lang=kr&units=metric") else { return }
        
        let dataTask = URLSession.shared.dataTask(with: weatherURL) { (data, response, err) in
            guard err == nil else { return print(err!.localizedDescription)}
            guard let response = response as? HTTPURLResponse,
                (200..<400).contains(response.statusCode) else {
                    return print("Invalid response") }
            guard let data = data else { return }
            
            if let decodeData = try? self.jsonDecoder.decode(WeatherData.self, from: data) {
                completion(decodeData)
            }
        }
        dataTask.resume()
    }
}
