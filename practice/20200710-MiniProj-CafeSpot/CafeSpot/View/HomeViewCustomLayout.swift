//
//  HomeViewCustomLayout.swift
//  CafeSpot
//
//  Created by 천지운 on 2020/07/13.
//  Copyright © 2020 Giftbot. All rights reserved.
//

import UIKit

protocol HomeViewCustomLayoutDelegate: class {
    func homeCollectionView(_ collectionView: UICollectionView, layout collectionViewLayout: HomeViewCustomLayout, sizeForPhotoAt indexPath: IndexPath) -> CGSize
}

class HomeViewCustomLayout: UICollectionViewLayout {
    
    // MARK: - Properties
    
    struct Layout {
        let numberOfColumns: Int
        let itemSize: CGSize
        let lineSpacing: CGFloat
        let interItemSpacing: CGFloat
        
        static let `default` = Layout(
            numberOfColumns: 2,
            itemSize: CGSize(width: 160, height: 120),
            lineSpacing: 12,
            interItemSpacing: 10
        )
    }
    var layout: Layout = .default
    weak var delegate: HomeViewCustomLayoutDelegate!
    
    private var layoutAttributes: [UICollectionViewLayoutAttributes] = []
    private var contentHeight: CGFloat = 0
    private var contentWidth: CGFloat {
        guard let cv = collectionView else { return 0 }
        let horizontalContentInset = cv.contentInset.left + cv.contentInset.right
        return cv.bounds.width - horizontalContentInset
    }
    
    // MARK: - Helpers
    
    override func invalidateLayout() {
        layoutAttributes.removeAll()
        super.invalidateLayout()
    }
    
    // MARK: - 1단계 - Prepare
    
    override func prepare() {
        guard let collectionView = collectionView,
            layoutAttributes.isEmpty else { return }
        
        let columnsCount = layout.numberOfColumns
        
        let totalItemSpacing = CGFloat(columnsCount - 1) * layout.interItemSpacing
        let cellWidth = (contentWidth - totalItemSpacing) / CGFloat(columnsCount)
        
        // item이 추가 될 때 마다 columns offset을 변경
        var xOffset: [CGFloat] = []
        var yOffset: [CGFloat] = Array(repeating: 0, count: columnsCount)
        
        for column in 0..<columnsCount {
            let startOffset = CGFloat(column) * (cellWidth + layout.interItemSpacing)
            xOffset.append(startOffset)
        }
        
        let numberOfItem = collectionView.numberOfItems(inSection: 0)
        var columnIndex = 0
        
        for item in 0..<numberOfItem {
            let indexPath = IndexPath(item: item, section: 0)
            let photoSize = delegate.homeCollectionView(collectionView, layout: self, sizeForPhotoAt: indexPath)
            
            // ratio 알아보기!!!
            let ratio = photoSize.width / cellWidth
            let cellHeight = ((photoSize.height) / ratio) + 80
            
            let minYOffset = yOffset.min() ?? 0
            columnIndex = yOffset.firstIndex(of: minYOffset) ?? 0
            
            let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
            attributes.frame = CGRect(
                x: xOffset[columnIndex], y: yOffset[columnIndex],
                width: cellWidth, height: cellHeight)
            layoutAttributes.append(attributes)
            
            yOffset[columnIndex] += cellHeight + layout.lineSpacing
        }
        self.contentHeight = (yOffset.max() ?? 0) - layout.lineSpacing
    }
    
    // 2단계 - collectionViewContentSize
    override var collectionViewContentSize: CGSize {
        guard let _ = collectionView else { return .zero }
        return CGSize(width: contentWidth, height: contentHeight)
    }
    
    // 3단계 - layoutAttributesForElements(in rect: CGRect)
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        return layoutAttributes.filter { $0.frame.intersects(rect) }
    }
    
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        // 해당 item에 해당되는 정보를 넘겨줌
        return layoutAttributes.first { $0.indexPath == indexPath }
    }
}
