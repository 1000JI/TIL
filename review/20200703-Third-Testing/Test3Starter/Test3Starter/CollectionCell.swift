//
//  CollectionCell.swift
//  Test3Starter
//
//  Created by 천지운 on 2020/07/03.
//  Copyright © 2020 Kira. All rights reserved.
//

import UIKit

class CollectionCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    static let identifier = "CollectionCell"
    
    private let productImageView: UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = .systemFill
        return iv
    }()
    
    private let menuTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .title1)
        label.text = "메뉴 이름"
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 36)
        label.textAlignment = .center
        label.backgroundColor = .lightGray
        return label
    }()
    
    private let menuPriceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .title2)
        label.text = "00000원"
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 28)
        label.textAlignment = .center
        label.backgroundColor = .lightGray
        return label
    }()
    
    // MARK: - LifeCycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Helpers
    
    func configureCell(data: [String: Any]) {
        guard let title = data["품명"] as? String else { return }
        guard let price = data["가격"] as? Int else { return }
        
        productImageView.image = UIImage(named: title)
        menuTitleLabel.text = title
        menuPriceLabel.text = "\(price)원"
    }
    
    func configureUI() {
        
        let stack = UIStackView(arrangedSubviews: [menuTitleLabel, menuPriceLabel])
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.backgroundColor = .lightGray
        
        addSubview(stack)
        stack.translatesAutoresizingMaskIntoConstraints = false
        addSubview(productImageView)
        productImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            productImageView.topAnchor.constraint(equalTo: topAnchor),
            productImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            productImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            productImageView.bottomAnchor.constraint(equalTo: stack.topAnchor),
        ])
        
        NSLayoutConstraint.activate([
            stack.leadingAnchor.constraint(equalTo: leadingAnchor),
            stack.trailingAnchor.constraint(equalTo: trailingAnchor),
            stack.bottomAnchor.constraint(equalTo: bottomAnchor),
            stack.heightAnchor.constraint(equalToConstant: 150)
        ])
    }
}
