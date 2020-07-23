//
//  HeaderView.swift
//  WeatherForecast
//
//  Created by 천지운 on 2020/07/21.
//  Copyright © 2020 Giftbot. All rights reserved.
//

import UIKit

class HeaderView: UIView {
    
    // MARK: - Properties
    
    var weatherInfo: WeatherModel? {
        didSet { configure() }
    }
    
    private let presentTemperatureLabel: UILabel = {
        let label = UILabel()
        label.text = "19.2°"
        label.font = .systemFont(ofSize: 120)
        label.textColor = .white
        return label
    }()
    
    private let weatherImageView: UIImageView = {
        let iv = UIImageView(image: UIImage(named: "01d"))
        iv.snp.makeConstraints { $0.width.height.equalTo(32) }
        return iv
    }()
    
    private let weatherLabel: UILabel = {
        let label = UILabel()
        label.text = "맑음"
        label.font = .systemFont(ofSize: 20)
        label.textColor = .white
        return label
    }()
    
    private let lowestTempratureLabel: UILabel = {
        let label = UILabel()
        label.text = "⤓ 13.0°"
        label.font = .systemFont(ofSize: 18)
        label.textColor = .white
        return label
    }()
    
    private let highestTempratureLabel: UILabel = {
        let label = UILabel()
        label.text = "⤒ 24.0°"
        label.font = .systemFont(ofSize: 18)
        label.textColor = .white
        return label
    }()
    
    // MARK: - LifeCycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(presentTemperatureLabel)
        presentTemperatureLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(16)
            $0.bottom.equalToSuperview()
        }
        
        let weatherStack = UIStackView(arrangedSubviews: [weatherImageView, weatherLabel])
        weatherStack.spacing = 4
        weatherStack.alignment = .bottom
        weatherStack.axis = .horizontal
        
        let tempratureStack = UIStackView(arrangedSubviews: [lowestTempratureLabel, highestTempratureLabel])
        tempratureStack.spacing = 4
        tempratureStack.axis = .horizontal
        
        let amountStack = UIStackView(arrangedSubviews: [weatherStack, tempratureStack])
        amountStack.axis = .vertical
        amountStack.alignment = .leading
        
        addSubview(amountStack)
        amountStack.snp.makeConstraints {
            $0.top.trailing.equalToSuperview()
            $0.leading.equalToSuperview().offset(16)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Helpers
    
    func configure() {
        guard let weatherInfo = weatherInfo else { return }
        let viewModel = HeaderViewModel(presentWeather: weatherInfo)
        
        DispatchQueue.main.async {
            self.weatherImageView.image = UIImage(named: weatherInfo.weather[0].icon)
            self.weatherLabel.text = weatherInfo.weather[0].description
            self.lowestTempratureLabel.text = viewModel.tempMinText
            self.highestTempratureLabel.text = viewModel.tempMaxText
            self.presentTemperatureLabel.text = viewModel.tempPresentText
        }
    }
}
