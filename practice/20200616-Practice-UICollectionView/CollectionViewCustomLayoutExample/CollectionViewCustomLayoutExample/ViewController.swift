//
//  ViewController.swift
//  CollectionViewExample
//
//  Copyright © 2020년 Giftbot. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
    
    @IBOutlet private weak var collectionView: UICollectionView!
    
    private lazy var photos: [Photo] = []
}

// MARK: - UICollectionViewDataSource

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: PhotoCollectionViewCell.identifier,
            for: indexPath
            ) as! PhotoCollectionViewCell
        
        let photo = photos[indexPath.item]
        if let image = UIImage(named: photo.imageName) {
            cell.configureCell(image: image)
        }
        return cell
    }
}


// MARK: - UICollectionViewDelegate

extension ViewController: UICollectionViewDelegate {
    
}
