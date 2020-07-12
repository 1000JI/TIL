//
//  CafeListCell.swift
//  CafeSpot
//
//  Created by 천지운 on 2020/07/12.
//  Copyright © 2020 Giftbot. All rights reserved.
//

import UIKit

class CafeListCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    static let identifier = "CafeListCell"
    
    var cafe: Cafe? { didSet { configure() } }
    
    private lazy var cafeImageView: UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = .systemRed
        iv.clipsToBounds = true
        iv.contentMode = .scaleToFill
        iv.image = UIImage(named: "트와블루")
        return iv
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "패캠커피"
        label.font = .systemFont(ofSize: 20)
        label.textAlignment = .left
        return label
    }()
    
    private let subTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "맛 좋고 사람 좋은 카페"
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 16)
        label.textAlignment = .left
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
    
    func configure() {
        guard let cafe = cafe else { return }
        cafeImageView.image = UIImage(named: cafe.title)
        titleLabel.text = cafe.title
        subTitleLabel.text = cafe.description
    }
    
    func configureUI() {
        addSubview(cafeImageView)
        
        cafeImageView.anchor(top: topAnchor, leading: leadingAnchor, trailing: trailingAnchor)
        cafeImageView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        cafeImageView.heightAnchor.constraint(equalToConstant: 180).isActive = true
        
        let stack = UIStackView(arrangedSubviews: [titleLabel, subTitleLabel])
        stack.axis = .vertical
        stack.spacing = 4
        stack.distribution = .fillProportionally
        addSubview(stack)
        
        stack.anchor(top: cafeImageView.bottomAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, paddingTop: 4, paddingBottom: 8)
    }
    
}
