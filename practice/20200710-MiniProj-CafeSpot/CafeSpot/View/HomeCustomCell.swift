//
//  HomeCustomCell.swift
//  CafeSpot
//
//  Created by 천지운 on 2020/07/10.
//  Copyright © 2020 Giftbot. All rights reserved.
//

import UIKit

protocol HomeCustomCellDelegate: class {
    func handleLikedEvent(_ cell: HomeCustomCell, isLike: Bool)
    func handleTapImage(_ cell: HomeCustomCell)
}

class HomeCustomCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    static let identifier = "HomeCustomCell"
    var cafe: Cafe? {
        didSet{ confiure() }
    }
    
    weak var delegate: HomeCustomCellDelegate?
    
    private var isLiked: Bool = false {
        didSet {
            if isLiked {
                likedButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
                likedButton.tintColor = .red
            } else {
                likedButton.setImage(UIImage(systemName: "heart"), for: .normal)
                likedButton.tintColor = .white
            }
        }
    }
    private var likedButton: UIButton!
    private lazy var cafeImageView: UIImageView = {
        let iv = UIImageView()
        iv.layer.cornerRadius = 20
        iv.clipsToBounds = true
        iv.contentMode = .scaleAspectFill
        iv.isUserInteractionEnabled = true
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTapImage))
        iv.addGestureRecognizer(tapGesture)
        
        likedButton = UIButton(type: .system)
        likedButton.setImage(UIImage(systemName: "heart"), for: .normal)
        likedButton.tintColor = .white
        likedButton.setDimensions(width: 40, height: 40)
        likedButton.addTarget(self, action: #selector(handleLiked), for: .touchUpInside)
        
        iv.addSubview(likedButton)
        likedButton.anchor(bottom: iv.bottomAnchor, trailing: iv.trailingAnchor, paddingBottom: 8, paddingTrailing: 8)
        
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
    
    private func confiure() {
        guard let cafeInfo = cafe else { return }
        cafeImageView.image = UIImage(named: cafeInfo.title)
        titleLabel.text = cafeInfo.title
        subTitleLabel.text = cafeInfo.description
        isLiked = cafeInfo.isFavorite
    }
    
    private func configureUI() {
        backgroundColor = .systemBackground
        
        let labelStack = UIStackView(arrangedSubviews: [titleLabel, subTitleLabel])
        labelStack.axis = .vertical
        labelStack.spacing = 4
        labelStack.distribution = .fillProportionally
        
        let imageStack = UIStackView(arrangedSubviews: [cafeImageView, labelStack])
        imageStack.axis = .vertical
        imageStack.spacing = 8
        labelStack.distribution = .fillProportionally
        
        addSubview(imageStack)
        imageStack.addConstraintsToFillView(self)
    }
    
    // MARK: - Selectors
    
    @objc func handleLiked(_ sender: UIButton) {
        isLiked.toggle()
        delegate?.handleLikedEvent(self, isLike: isLiked)
    }
    
    @objc func handleTapImage() {
        delegate?.handleTapImage(self)
    }
    
}
