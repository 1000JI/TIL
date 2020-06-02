//
//  DetailViewController.swift
//  Dominos11_Starter
//
//  Created by Lee on 2020/05/26.
//  Copyright © 2020 Kira. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    private let detailImage = UIImageView()
    private let countStackView = UIStackView()
    var menuCount: Int = 0 {
        didSet {
            countLabel.text = "\(menuCount) 개"
        }
    }
    
    var orderName: String = ""
    var orderPrice: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }
    
    lazy var minusButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("-", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        button.layer.borderWidth = 3
        button.layer.borderColor = UIColor.darkGray.cgColor
        button.titleLabel?.font = .boldSystemFont(ofSize: 20)
        button.addTarget(self, action: #selector(clickedMinusButton), for: .touchUpInside)
        return button
    }()

    @objc func clickedMinusButton(_ sender: UIButton) {
        guard menuCount > 0 else { return }
        menuCount -= 1
        
        if SaveProduct.orderMenu[orderName] != nil && menuCount == 0 {
            SaveProduct.orderMenu[orderName] = nil
            return
        }
        
        SaveProduct.orderMenu[orderName] = [
            "사진": "\(orderName)",
            "가격": orderPrice,
            "개수": menuCount
        ]
    }
    
    lazy var plusButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("+", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        button.layer.borderWidth = 3
        button.layer.borderColor = UIColor.darkGray.cgColor
        button.titleLabel?.font = .boldSystemFont(ofSize: 20)
        button.addTarget(self, action: #selector(clickedPlusButton), for: .touchUpInside)
        return button
    }()

    @objc func clickedPlusButton(_ sender: UIButton) {
        menuCount += 1
        
        SaveProduct.orderMenu[orderName] = [
            "사진": "\(orderName)",
            "가격": orderPrice,
            "개수": menuCount
        ]
    }
    
    lazy var countLabel: UILabel = {
        let label = UILabel()
        label.text = "0 개"
        label.font = .boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        label.textColor = .white
        label.backgroundColor = .darkGray
        return label
    }()
    
    private func setupLayout() {
        
        detailImage.image = UIImage(named: orderName)
        view.addSubview(detailImage)
        detailImage.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(countStackView)
        countStackView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            detailImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            detailImage.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            detailImage.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0)
        ])
        
        countStackView.addArrangedSubview(minusButton)
        countStackView.addArrangedSubview(countLabel)
        countStackView.addArrangedSubview(plusButton)
        
        NSLayoutConstraint.activate([
            countStackView.topAnchor.constraint(equalTo: detailImage.bottomAnchor, constant: 50),
            countStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50),
            countStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50),
            countStackView.heightAnchor.constraint(equalToConstant: 50),
            countStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50)
        ])
        
        minusButton.translatesAutoresizingMaskIntoConstraints = false
        plusButton.translatesAutoresizingMaskIntoConstraints = false
        countLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            minusButton.widthAnchor.constraint(equalToConstant: 50),
            plusButton.widthAnchor.constraint(equalTo: minusButton.widthAnchor)
        ])
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateCount()
    }
    private func updateCount() {
        if let product = SaveProduct.orderMenu[orderName] {
            menuCount = product["개수"] as! Int
        } else {
            menuCount = 0
        }
    }
}
