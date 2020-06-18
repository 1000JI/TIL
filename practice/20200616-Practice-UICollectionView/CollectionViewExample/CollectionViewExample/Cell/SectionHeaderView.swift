//
//  SectionHeaderView.swift
//  CollectionViewExample
//
//  Copyright © 2020 giftbot. All rights reserved.
//

import UIKit

final class SectionHeaderView: UICollectionReusableView {
    static let identifier = "SectionHeaderView"
    
    private let blurView = UIVisualEffectView() // Scroll 시 블러 효과(?) 같은 것을 줌
    private let imageView = UIImageView()
    private let titleLabel = UILabel()
    
    // MARK: Init
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }
    
    // MARK: Setup
    
    func setupViews() {
        let blurEffect = UIBlurEffect(style: .light)
        blurView.effect = blurEffect
        addSubview(blurView)
        
        blurView.contentView.addSubview(imageView)
        
        titleLabel.textColor = .black
        titleLabel.font = .preferredFont(forTextStyle: .title2)
        blurView.contentView.addSubview(titleLabel)
    }
    
    func setupConstraints() {
        [blurView, imageView, titleLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            blurView.topAnchor.constraint(equalTo: topAnchor),
            blurView.leadingAnchor.constraint(equalTo: leadingAnchor),
            blurView.trailingAnchor.constraint(equalTo: trailingAnchor),
            blurView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            imageView.centerYAnchor.constraint(equalTo: blurView.centerYAnchor),
            imageView.leadingAnchor.constraint(equalTo: blurView.leadingAnchor, constant: 20),
            imageView.heightAnchor.constraint(equalTo: blurView.heightAnchor, multiplier: 0.75),
            imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor, multiplier: 1.5),
            
            titleLabel.centerYAnchor.constraint(equalTo: blurView.centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: blurView.trailingAnchor),
        ])
    }
    
    
    // MARK: Configure
    
    func configure(image: UIImage?, title: String) {
        imageView.image = image
        titleLabel.text = title
    }
}
