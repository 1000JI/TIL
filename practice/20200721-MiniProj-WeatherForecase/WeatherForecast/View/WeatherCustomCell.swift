//
//  WeatherCustomCell.swift
//  WeatherForecast
//
//  Created by 천지운 on 2020/07/21.
//  Copyright © 2020 Giftbot. All rights reserved.
//

import UIKit

class WeatherCustomCell: UITableViewCell {
    
    // MARK: - Properties
    
    static let identifier = "WeatherCustomCell"
    
    var weather: WeatherList? {
        didSet { configure() }
    }
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.text = "5.29 (Mon)"
        label.font = .systemFont(ofSize: 20)
        label.textColor = .white
        return label
    }()
    
    private let timeLabel: UILabel = {
        let label = UILabel()
        label.text = "12:00"
        label.font = .boldSystemFont(ofSize: 24)
        label.textColor = .white
        return label
    }()
    
    private let weatherImageView: UIImageView = {
        let iv = UIImageView(image: UIImage(named: "01d"))
        iv.snp.makeConstraints { $0.height.width.equalTo(40) }
        return iv
    }()
    
    private let temperatureLabel: UILabel = {
        let label = UILabel()
        label.text = "27°"
        label.font = .systemFont(ofSize: 40)
        label.textColor = .white
        return label
    }()
    
    // MARK: - LifeCycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Helpers
    
    func configureUI() {
        backgroundColor = .clear
        
        let dateStack = UIStackView(arrangedSubviews: [dateLabel, timeLabel])
        dateStack.distribution = .fillProportionally
        dateStack.axis = .vertical
        
        addSubview(dateStack)
        dateStack.snp.makeConstraints {
            $0.top.leading.equalToSuperview().offset(8)
        }
        
        addSubview(weatherImageView)
        weatherImageView.snp.makeConstraints {
            $0.centerX.equalToSuperview().offset(12)
            $0.top.equalToSuperview()
        }
        
        let underView = UIView()
        underView.backgroundColor = .lightGray
        addSubview(underView)
        underView.snp.makeConstraints {
            $0.centerX.equalTo(weatherImageView.snp.centerX)
            $0.width.equalTo(weatherImageView)
            $0.height.equalTo(1)
            $0.top.equalTo(weatherImageView.snp.bottom).offset(20)
        }
        
        addSubview(temperatureLabel)
        temperatureLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.trailing.equalToSuperview().offset(-8)
        }
    }
    
    func configure() {
        guard let weather = weather else { return }
        let viewModel = WeatherCellViewModel(weather: weather)
        
        dateLabel.text = viewModel.dateText
        timeLabel.text = viewModel.timeText
        weatherImageView.image = UIImage(named: viewModel.iconName)
        temperatureLabel.text = viewModel.tempText
    }
}
