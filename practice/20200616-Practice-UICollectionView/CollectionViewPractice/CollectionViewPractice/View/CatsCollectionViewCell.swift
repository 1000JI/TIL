//
//  CatsCollectionViewCell.swift
//  CollectionViewPractice
//
//  Created by 천지운 on 2020/06/16.
//  Copyright © 2020 Giftbot. All rights reserved.
//

import UIKit

class CatsCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    static let cellIdentifier = "AnimalCell"
    
    var isCheckMarkHidden = false {
        didSet {
            checkImageView.isHidden = isCheckMarkHidden
            if isCheckMarkHidden {
                catImageView.alpha = 1
            } else {
                catImageView.alpha = 0.7
            }
        }
    }
    
    let catImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    let checkImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.isHidden = true
        imageView.image = UIImage(systemName: "checkmark.circle.fill")
        imageView.tintColor = .white
        return imageView
    }()
    
    // MARK: - LifeCycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        checkImageView.isHidden = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        catImageView.frame = bounds
    }
    
    // MARK: - Helpers
    
    private func configureUI() {
        layer.cornerRadius = 20
        clipsToBounds = true
        
        addSubview(catImageView)
        catImageView.frame = bounds
        
        addSubview(checkImageView)
        checkImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            checkImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12),
            checkImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            checkImageView.widthAnchor.constraint(equalToConstant: 50),
            checkImageView.heightAnchor.constraint(equalTo: checkImageView.widthAnchor)
        ])
        checkImageView.layer.cornerRadius = 50 / 2
    }
    
}
