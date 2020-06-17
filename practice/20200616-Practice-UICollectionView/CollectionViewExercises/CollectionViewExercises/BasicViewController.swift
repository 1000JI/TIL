//
//  BasicViewController.swift
//  CollectionViewExercises
//
//  Copyright © 2020 Giftbot. All rights reserved.
//

import UIKit

// [ 문제 ]
// edgeInset은 각각 8, 셀 간격과 줄 간격 = 4
// 아이템 크기는 한 줄에 4개가 나올 수 있도록 설정. 크기는 차이나도 무방

final class BasicViewController: UIViewController {
    
    // MARK: - Properties
    
    let dataSource = cards
    let edgeInsetSize = CGFloat(8)
    let gapSize = CGFloat(4)
    
    var collectionView: UICollectionView!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        configureCollectionView()
    }
    
    // MARK: - Helpers
    
    func configureCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: edgeInsetSize, left: edgeInsetSize, bottom: edgeInsetSize, right: edgeInsetSize)
        layout.minimumLineSpacing = gapSize
        layout.minimumInteritemSpacing = gapSize
        
        let subEdgeInsetSize = (edgeInsetSize * 2) / 4
        let subGapSize = gapSize - (gapSize / 4)
        let widthSize = CGFloat((view.frame.width / 4) - subEdgeInsetSize - subGapSize)
        
//        let itemCount = 4
//        let widthSize:CGFloat = collectionView.bounds.width
//            - (gapSize * (itemCount - 1))
//            - (layout.sectionInset.left + layout.sectionInset.right)
        
        layout.itemSize = CGSize(width: widthSize, height: widthSize)
        
        collectionView = UICollectionView(frame: view.frame, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "CardCell")
        collectionView.dataSource = self
        view.addSubview(collectionView)
    }
    
    func configureUI() {
        view.backgroundColor = .systemBackground
    }
    
}

// MARK: - UICollectionViewDataSource

extension BasicViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CardCell", for: indexPath)
        
        cell.contentView.backgroundColor = dataSource[indexPath.row].color
        
        return cell
    }
}
