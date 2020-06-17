//
//  CatImageView.swift
//  CollectionViewPractice
//
//  Created by 천지운 on 2020/06/16.
//  Copyright © 2020 Giftbot. All rights reserved.
//

import UIKit

class CatImageView: UIImageView {
    
    // MARK: - Properties
    
    
    // MARK: LifeCycle
    
    init(catCount: Int) {
        super.init(frame: .zero)
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
