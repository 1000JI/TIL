//
//  HeaderView.swift
//  Test3Starter
//
//  Created by 천지운 on 2020/07/03.
//  Copyright © 2020 Kira. All rights reserved.
//

import UIKit

class HeaderView: UICollectionReusableView {
    
    // MARK: - Properties
    
    static let identifier = "HeaderView"
    
    private let headerImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.backgroundColor = .yellow
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
        addSubview(headerImageView)
        headerImageView.frame = frame
    }
}
