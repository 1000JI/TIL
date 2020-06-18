//
//  SectionViewController.swift
//  CollectionViewExample
//
//  Copyright © 2020 giftbot. All rights reserved.
//

import UIKit

final class SectionViewController: UIViewController {
    
    // CollectionView 설정
    
    // MARK: - Properties
    
    let states = ParkManager.imageNames(of: .state)
    let parkList = ParkManager.list
    
    lazy var collectionView = UICollectionView(
        frame: view.frame,
        collectionViewLayout: layout
    )
    
    let layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        layout.minimumInteritemSpacing = 15
        layout.minimumLineSpacing = 15
        layout.itemSize = .init(width: 150, height: 150)
        
        // width 의미? => 가로로 Scroll 할 경우 사용되며, height는 가로로 Scroll 할 경우 무시됨
        layout.headerReferenceSize = CGSize(width: 60, height: 60)
        layout.footerReferenceSize = CGSize(width: 50, height: 50)
        
        layout.sectionHeadersPinToVisibleBounds = true
        
        return layout
    }()
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
    }
    
    // MARK: - Helpers
    
    func setupCollectionView() {
        collectionView.register(
            SectionCell.self,
            forCellWithReuseIdentifier: SectionCell.identifier
        )
        
        collectionView.register(
            SectionHeaderView.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: SectionHeaderView.identifier
        )
        
        collectionView.register(
            SectionFooterView.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter,
            withReuseIdentifier: SectionFooterView.identifier
        )
        
        collectionView.backgroundColor = .systemBackground
        collectionView.dataSource = self
        view.addSubview(collectionView)
    }
}

// MARK: - UICollectionViewDataSource

extension SectionViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return states.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let parks = parkList.filter { $0.location.rawValue == states[section] }
        return parks.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SectionCell.identifier, for: indexPath
            ) as! SectionCell
        
        let parks = parkList.filter { $0.location.rawValue == states[indexPath.section] }
        let parkName = parks[indexPath.item].name
        cell.configure(image: UIImage(named: parkName), title: parkName)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        // Supplementary -> Section Header, Footer
        if kind == UICollectionView.elementKindSectionHeader {
            let header = collectionView.dequeueReusableSupplementaryView(
                ofKind: kind,
                withReuseIdentifier: SectionHeaderView.identifier,
                for: indexPath
            ) as! SectionHeaderView
            
            let state = states[indexPath.section]
            header.configure(image: UIImage(named: state), title: state)
            return header
        } else {
            let footer = collectionView.dequeueReusableSupplementaryView(
                ofKind: kind,
                withReuseIdentifier: SectionFooterView.identifier,
                for: indexPath
            ) as! SectionFooterView
            
            let count = parkList.filter { $0.location.rawValue == states[indexPath.section] }.count
            let title = "총 \(count)개 이미지"
            footer.configure(title: title)
            return footer
        }
    }
}

