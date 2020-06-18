//
//  PhotoCollectionViewLayout.swift
//  CollectionViewExample
//
//  Copyright © 2020년 Giftbot. All rights reserved.
//

import UIKit

final class PhotoCollectionViewLayout: UICollectionViewLayout {
    
    struct Layout {
        let numberOfColumns: Int
        let itemSize: CGSize
        let lineSpacing: CGFloat
        let interItemSpacing: CGFloat
        
        static let `default` = Layout(
            numberOfColumns: 2,
            itemSize: CGSize(width: 160, height: 120),
            lineSpacing: 10,
            interItemSpacing: 10
        )
    }
    
    var layout: Layout = .default
    
}
