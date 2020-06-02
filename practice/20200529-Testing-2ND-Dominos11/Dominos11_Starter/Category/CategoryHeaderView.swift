//
//  CategoryHeaderView.swift
//  Dominos11_Starter
//
//  Created by 천지운 on 2020/05/29.
//  Copyright © 2020 Kira. All rights reserved.
//

import UIKit

class CategoryHeaderView: UIView {
    
    var imageView: UIImageView = UIImageView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(imageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.image = UIImage(named: "logo")
        imageView.frame = frame
        imageView.contentMode = .scaleAspectFit
    }

}
