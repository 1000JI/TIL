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
    
    var dataSource: [Section] = sections
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}


// MARK: - UICollectionViewDataSource

extension SupplementaryViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        return cell
    }
}
