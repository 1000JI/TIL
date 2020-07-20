//
//  DetailPictureCell.swift
//  CafeSpot
//
//  Created by 천지운 on 2020/07/10.
//  Copyright © 2020 Giftbot. All rights reserved.
//

import UIKit

class DetailPictureCell: UITableViewCell {
    
    // MARK: - Properties
    
    static let identifier = "DetailPictureCell"
    var cafe: Cafe? { didSet { configure() } }
    
    private lazy var pictureScrollView: UIScrollView = {
        let sv = UIScrollView()
        sv.backgroundColor = .systemBackground
        sv.isPagingEnabled = true
        sv.showsHorizontalScrollIndicator = false
        sv.delegate = self
        return sv
    }()
    
    private let pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.currentPage = 0
        pc.layer.cornerRadius = 20
        pc.backgroundColor = UIColor(white: 0.3, alpha: 0.5)
        return pc
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "패캠커피"
        label.font = .systemFont(ofSize: 32)
        label.textAlignment = .left
        return label
    }()
    
    private let subTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "맛 좋고 사람 좋은 카페"
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 24)
        label.textAlignment = .left
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
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        configureScrollView()
    }
    
    // MARK: - Helpers
    
    func configure() {
        guard let cafe = cafe else { return }
        
        titleLabel.text = cafe.title
        subTitleLabel.text = cafe.description
    }
    
    func configureUI() {
        backgroundColor = .systemBackground
        
        addSubview(pictureScrollView)
        pictureScrollView.anchor(top: topAnchor, leading: leadingAnchor, trailing: trailingAnchor)
        
        addSubview(pageControl)
        pageControl.centerX(inView: pictureScrollView)
        pageControl.anchor(bottom: pictureScrollView.bottomAnchor, paddingBottom: 20)
        
        let stack = UIStackView(arrangedSubviews: [titleLabel, subTitleLabel])
        stack.axis = .vertical
        stack.spacing = 12
        stack.distribution = .fillProportionally
        
        addSubview(stack)
        stack.anchor(top: pictureScrollView.bottomAnchor, leading: leadingAnchor,
                     bottom: bottomAnchor, trailing: trailingAnchor,
                     paddingTop: 16, paddingLeading: 16, paddingBottom: 16, paddingTrailing: 16)
    }
    
    func configureScrollView() {
        guard let cafe = cafe else { return }
        
        var index: Int = 1
        var imageData = [UIImage]()
        
        while true {
            let number = String(format: "%02d", index)
            let imageName = "\(cafe.title)\(number)"
            guard let image = UIImage(named: imageName) else { break }
            imageData.append(image)
            index += 1
        }
        
        let widthSize = self.frame.size.width
        imageData.enumerated().forEach {
            let imageView = UIImageView(image: $1)
            imageView.contentMode = .scaleToFill
            pictureScrollView.addSubview(imageView)
            
            let xPosition = widthSize * CGFloat($0)
            imageView.anchor(top: pictureScrollView.topAnchor,
                             leading: pictureScrollView.leadingAnchor,
                             paddingLeading: xPosition,
                             width: widthSize,
                             height: pictureScrollView.frame.height)
            
            pictureScrollView.contentSize.width = widthSize * CGFloat($0 + 1)
            pageControl.numberOfPages = $0 + 1
        }
        pageControl.widthAnchor.constraint(equalToConstant: CGFloat(20 * imageData.count)).isActive = true
    }
}

extension DetailPictureCell: UIScrollViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(scrollView.contentOffset.x / scrollView.frame.maxX)
    }
}
