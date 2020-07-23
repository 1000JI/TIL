//
//  WeatherCasterViewController.swift
//  WeatherForecast
//
//  Created by 천지운 on 2020/07/21.
//  Copyright © 2020 Giftbot. All rights reserved.
//

import UIKit
import SnapKit

class WeatherCasterViewController: UIViewController {
    
    // MARK: - Properties

    // Var
    
    private var backgroundCount: Int = 0
    private let backgroundImageNames: [String] = ["sunny", "cloudy", "lightning", "rainy"]
    private var presentWeatherData: WeatherModel? {
        didSet { configure() }
    }
    private var otherWeatherData: WeatherData? {
        didSet {
            DispatchQueue.main.async {
                self.weatherListTableView.reloadData()
                self.updateLayout()
            }
        }
    }
    private lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko_KR")
        formatter.dateFormat = "a HH:mm"
        return formatter
    }()
    
    // View
    
    private let headerView = HeaderView()
    private let weatherListTableView = UITableView()
    private var blurEffectView: UIVisualEffectView!

    private lazy var weatherScrollView: UIScrollView = {
        let sv = UIScrollView()
        sv.backgroundColor = .clear
        sv.delegate = self
        sv.showsVerticalScrollIndicator = false
        return sv
    }()
    
    private lazy var backgroundImageView: UIImageView = {
        let iv = UIImageView(image: UIImage(named: "sunny"))
        iv.contentMode = .scaleAspectFill
        
        let blurEffect = UIBlurEffect(style: .dark)
        blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        blurEffectView.alpha = 0
        iv.addSubview(blurEffectView)
        
        blurEffectView.snp.makeConstraints {
            $0.top.centerX.bottom.equalToSuperview()
            $0.width.equalTo(iv.image!.size.width)
        }
        
        return iv
    }()
    
    private let cityNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Cupertino N Blaney Ave"
        label.font = .boldSystemFont(ofSize: 18)
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    private let timeLabel: UILabel = {
        let label = UILabel()
        label.text = "오후 12:14"
        label.font = .systemFont(ofSize: 16)
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    private lazy var weatherTopStackView: UIStackView = {
        let weatherTopStack = UIStackView(arrangedSubviews: [cityNameLabel, timeLabel])
        weatherTopStack.axis = .vertical
        weatherTopStack.distribution = .fillProportionally
        return weatherTopStack
    }()
    
    private lazy var reloadButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "arrow.clockwise"), for: .normal)
        button.imageView!.snp.makeConstraints {
            $0.width.height.equalTo(28)
        }
        button.tintColor = .white
        button.addTarget(self, action: #selector(handleReload), for: .touchUpInside)
        return button
    }()
    
    // MARK: - View Setting
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureTableView()
        fetchWeather()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        updateLayout()
    }
    
    func updateLayout() {
        let cell = weatherListTableView.cellForRow(at: IndexPath(row: weatherListTableView.numberOfRows(inSection: 0) - 1, section: 0))
        let tableViewMinY = weatherListTableView.frame.minY
        let cellMaxY = cell?.frame.maxY ?? 0
        weatherScrollView.contentSize = CGSize(width: view.frame.width, height: (tableViewMinY + cellMaxY) + 80)
    }
    
    // MAKR: - API
    
    func fetchWeather() {
        WeatherService.shared.fetchCurrentWeather { weather in
            self.presentWeatherData = weather
            self.headerView.weatherInfo = weather
        }
        
        WeatherService.shared.fetchFiveDayThreeHourWeather { weatherData in
            self.otherWeatherData = weatherData
        }
    }
    
    // MARK: - Selectors
    
    @objc func configure() {
        guard let presentWeather = presentWeatherData else { return }
        
        DispatchQueue.main.async {
            self.cityNameLabel.text = presentWeather.name
            self.timeLabel.text = self.dateFormatter.string(
                from: Date(timeIntervalSince1970: presentWeather.dt))
            
            let weatherType = WeatherType(rawValue: presentWeather.weather[0].main)
            guard let weatherName = weatherType else { return print("No Weather") }
            switch weatherName {
            case .cloudy: self.backgroundImageView.image = UIImage(named: "cloudy")
            case .sunny: self.backgroundImageView.image = UIImage(named: "sunny")
            case .rainy: self.backgroundImageView.image = UIImage(named: "rainy")
            }
        }
    }

    @objc func handleReload(_ sender: UIButton) {
        sender.rotate()
        
        backgroundCount += 1
        
        UIView.animateKeyframes(
            withDuration: 0.5,
            delay: 0,
            options: [],
            animations: {
                UIView.addKeyframe(
                    withRelativeStartTime: 0,
                    relativeDuration: 0.5) {
                        self.weatherTopStackView.alpha = 0
                }
                
                UIView.addKeyframe(
                    withRelativeStartTime: 0.5,
                    relativeDuration: 0.5) {
                        self.weatherTopStackView.alpha = 1
                }
        }, completion: nil)
        
        
        headerView.transform = CGAffineTransform(translationX: 500, y: 0)
        headerView.alpha = 0
        UIView.transition(with: backgroundImageView,
                          duration: 0.5,
                          options: .transitionCrossDissolve,
                          animations: {
                            self.backgroundImageView.image = UIImage(named: self.backgroundImageNames[self.backgroundCount % self.backgroundImageNames.count])
                            self.headerView.transform = .identity
                            self.headerView.alpha = 1
                            
        }, completion: nil)
    }
    
    // MARK: - Helpers
    
    func configureTableView() {
        weatherListTableView.rowHeight = 80
        weatherListTableView.dataSource = self
        weatherListTableView.backgroundColor = .clear
        weatherListTableView.isScrollEnabled = false
        weatherListTableView.separatorStyle = .none
        weatherListTableView.allowsSelection = false
        
        weatherListTableView.register(WeatherCustomCell.self, forCellReuseIdentifier: WeatherCustomCell.identifier)
    }
    
    func configureUI() {
        view.addSubview(backgroundImageView)
        backgroundImageView.snp.makeConstraints { $0.edges.equalToSuperview() }
        
        view.addSubview(weatherTopStackView)
        weatherTopStackView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(4)
            $0.centerX.equalToSuperview()
        }
        
        view.addSubview(reloadButton)
        reloadButton.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(4)
            $0.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).offset(-16)
        }
        
        
        // MAIN
        
        view.addSubview(weatherScrollView)
        weatherScrollView.snp.makeConstraints {
            $0.top.equalTo(weatherTopStackView.snp.bottom)
            $0.leading.bottom.trailing.equalToSuperview()
        }
        
        weatherScrollView.addSubview(headerView)
        headerView.snp.makeConstraints {
            $0.leading.trailing.width.equalToSuperview()
            $0.top.equalToSuperview().offset(view.frame.height * 0.67)
            $0.height.equalTo(200)
        }
        
        weatherScrollView.addSubview(weatherListTableView)
        weatherListTableView.snp.makeConstraints {
            $0.top.equalTo(headerView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(5000)
        }
    }
}

// MARK: - UITableViewDataSource

extension WeatherCasterViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let otherWeatherData = otherWeatherData else { return 5 }
        return otherWeatherData.cnt
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: WeatherCustomCell.identifier, for: indexPath) as! WeatherCustomCell
        
        guard let otherWeatherData = otherWeatherData else { return cell }
        
        cell.weather = otherWeatherData.list[indexPath.row]
        
        return cell
    }
}

// MAKR: - UIScrollViewDelegate

extension WeatherCasterViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let height = view.frame.height - 240
        let offset = height - scrollView.contentOffset.y
        let alphaValue = offset / height
        blurEffectView.alpha = 1 - (alphaValue < 0.3 ? 0.3 : alphaValue)
        
        let originValue = alphaValue * 30
        backgroundImageView.frame.origin.x = 30 - (originValue < 0
            ? 0 : (originValue > 30 ?
            30 : originValue))
    }
}

// MARK: - extension UIView

extension UIView {
    func rotate() {
        let rotation: CABasicAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        rotation.toValue = NSNumber(value: Double.pi * 2)
        rotation.duration = 0.5
        rotation.isCumulative = true // ?
        rotation.repeatCount = 1
        self.layer.add(rotation, forKey: "rotationAnimation")
    }
}
