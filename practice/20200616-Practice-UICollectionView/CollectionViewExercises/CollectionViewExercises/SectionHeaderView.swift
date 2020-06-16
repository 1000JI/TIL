//
//  SectionHeaderView.swift
//  CollectionViewExercises
//
//  Copyright © 2020 Giftbot. All rights reserved.
//

import UIKit

// 코드 수정 불필요

final class SectionHeaderView: UICollectionReusableView {
  static let identifier = "SectionHeaderView"
  private let titleLabel = UILabel()
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupView()
  }
  
  
  private func setupView() {
    titleLabel.textColor = .darkText
    titleLabel.textAlignment = .center
    titleLabel.font = UIFont.preferredFont(forTextStyle: .title1)
    addSubview(titleLabel)
    
    titleLabel.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
      titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor)
    ])
  }
  
  
  // MARK: Configure
  
  func configure(title: String) {
    titleLabel.text = title
  }
}
