//
//  SupplementaryViewController.swift
//  CollectionViewExercises
//
//  Copyright © 2020 Giftbot. All rights reserved.
//

import UIKit

// [ 문제 ]
// 셀 크기 = (80, 80) / 아이템과 라인 간격 = 4 / 인셋 = (25, 5, 25, 5)
// 헤더 높이 50, 푸터 높이 3

final class SupplementaryViewController: UIViewController {
    
    // MARK: - Properties
    
    var dataSource: [Section] = sections
    lazy var collectionView: UICollectionView = {
        let cv = UICollectionView(
            frame: view.frame,
            collectionViewLayout: layout
        )
        cv.backgroundColor = .white
        cv.dataSource = self
        return cv
    }()
    let layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 50, height: 50)
        layout.minimumLineSpacing = 4.0
        layout.minimumInteritemSpacing = 4.0
        layout.sectionInset = UIEdgeInsets(top: 25, left: 5, bottom: 25, right: 5)
        
        layout.headerReferenceSize = CGSize(width: 50, height: 50)
        layout.footerReferenceSize = CGSize(width: 3, height: 3)
        
        layout.sectionHeadersPinToVisibleBounds = true
        return layout
    }()
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureCollectionView()
    }
    
    // MARK: - Helpers
    
    func configureUI() {
        view.backgroundColor = .white
    }
    
    func configureCollectionView() {
        collectionView.register(SectionCell.self,
                                forCellWithReuseIdentifier: SectionCell.identifier)
        view.addSubview(collectionView)
        
        collectionView.register(SectionHeaderView.self,
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                withReuseIdentifier: SectionHeaderView.identifier)
        
        collectionView.register(SectionFooterView.self,
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter,
                                withReuseIdentifier: SectionFooterView.identifier)
    }
    
}


// MARK: - UICollectionViewDataSource

extension SupplementaryViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource[section].cards.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SectionCell.identifier, for: indexPath) as! SectionCell
        
        cell.card = dataSource[indexPath.section].cards[indexPath.item]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if kind == UICollectionView.elementKindSectionHeader {
            let header = collectionView.dequeueReusableSupplementaryView(
                ofKind: kind,
                withReuseIdentifier: SectionHeaderView.identifier,
                for: indexPath
            ) as! SectionHeaderView
            
            header.configure(title: "\(indexPath.section)번째")
            return header
        } else {
            let footer = collectionView.dequeueReusableSupplementaryView(
                ofKind: kind,
                withReuseIdentifier: SectionFooterView.identifier,
                for: indexPath
            )
            return footer
        }
    }
}
