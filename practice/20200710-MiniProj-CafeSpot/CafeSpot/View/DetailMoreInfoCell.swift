//
//  DetailMoreInfoCell.swift
//  CafeSpot
//
//  Created by 천지운 on 2020/07/11.
//  Copyright © 2020 Giftbot. All rights reserved.
//

import UIKit
import MapKit

protocol DetailMoreInfoCellDelegate: class {
    func handleInstagram()
    func handleNaverMap()
}

class DetailMoreInfoCell: UITableViewCell {
    
    // MARK: - Properties
    
    static let identifier = "DetailMoreInfoCell"
    
    weak var delegate: DetailMoreInfoCellDelegate?
    
    private let titleImage: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(systemName: "info.circle")
        iv.tintColor = .label
        iv.setDimensions(width: 36, height: 36)
        return iv
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "추가 정보"
        label.font = .systemFont(ofSize: 28)
        label.textAlignment = .left
        return label
    }()
    
    private var instaView: UIView!
    private var naverView: UIView!
    
    // MARK: - LifeCycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
        configureViewAction()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Selectors
    
    @objc func handleInsta() {
        delegate?.handleInstagram()
    }
    
    @objc func handleNaver() {
        delegate?.handleNaverMap()
    }
    
    // MARK: - Helpers
    
    func configureUI() {
        backgroundColor = .systemBackground
        
        let stack = UIStackView(arrangedSubviews: [titleImage, titleLabel])
        stack.axis = .horizontal
        stack.spacing = 12
        stack.distribution = .fillProportionally
        
        addSubview(stack)
        
        stack.anchor(top: topAnchor, leading: leadingAnchor, trailing: trailingAnchor, paddingTop: 24, paddingLeading: 24, paddingTrailing: 24)
        
        instaView = makeSiteButtonView(with: "인스타그램 확인", imageName: "instagram")
        
        naverView = makeSiteButtonView(with: "네이버맵 길 찾기", imageName: "navermap")
        
        let siteStack = UIStackView(arrangedSubviews: [instaView, naverView])
        siteStack.axis = .horizontal
        siteStack.spacing = 24
        siteStack.distribution = .fillEqually
        
        addSubview(siteStack)
        siteStack.heightAnchor.constraint(equalToConstant: 60).isActive = true
        siteStack.centerY(inView: self, constant: 20)
        siteStack.anchor(leading: leadingAnchor, trailing: trailingAnchor, paddingLeading: 12, paddingTrailing: 12)
    }
    
    func configureViewAction() {
        let tapInstaGesture = UITapGestureRecognizer(target: self, action: #selector(handleInsta))
        instaView.addGestureRecognizer(tapInstaGesture)
        let tapNaverGesture = UITapGestureRecognizer(target: self, action: #selector(handleNaver))
        naverView.addGestureRecognizer(tapNaverGesture)
    }
    
    func makeSiteButtonView(with title: String, imageName: String) -> UIView {
        let view = UIView()
        view.isUserInteractionEnabled = true
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.layer.borderWidth = 0.5
        view.layer.shadowColor = UIColor.lightGray.cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 0)
        view.layer.shadowRadius = 3
        view.layer.shadowOpacity = 1.0
        
        let imageView = UIImageView()
        imageView.image = UIImage(named: imageName)
        imageView.setDimensions(width: 40, height: 40)
        imageView.contentMode = .scaleToFill
        
        let siteTitle = UILabel()
        siteTitle.text = title
        siteTitle.textColor = .black
        siteTitle.font = .systemFont(ofSize: 16)
        siteTitle.textAlignment = .left
        
        let moreStackView = UIStackView(arrangedSubviews: [imageView, siteTitle])
        moreStackView.axis = .horizontal
        moreStackView.spacing = 8
        moreStackView.distribution = .fillProportionally
        moreStackView.alignment = .center
        
        view.addSubview(moreStackView)
//        moreStackView.addConstraintsToFillView(view)
        moreStackView.centerY(inView: view)
        moreStackView.anchor(leading: view.leadingAnchor, trailing: view.trailingAnchor, paddingLeading: 8, paddingTrailing: 8)
        
        return view
    }
}
