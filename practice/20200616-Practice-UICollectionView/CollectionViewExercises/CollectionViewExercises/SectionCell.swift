//
//  SectionCell.swift
//  CollectionViewExercises
//
//  Created by 천지운 on 2020/06/18.
//  Copyright © 2020 Giftbot. All rights reserved.
//

import UIKit

class SectionCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    var card: Card? {
        didSet {
            configure()
        }
    }
    
    static let identifier = "SectionCell"
    
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = .systemPink
        return iv
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
    
    func configureUI() {
        addSubview(imageView)
        imageView.frame = bounds
    }
    
    func configure() {
        imageView.backgroundColor = card?.color
    }
    
}
