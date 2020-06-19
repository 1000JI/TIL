//
//  ViewController.swift
//  CollectionViewExample
//
//  Copyright © 2020년 Giftbot. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
    
    // MARK: - Properties
    
    @IBOutlet private weak var collectionView: UICollectionView! {
        didSet {
            let layout = collectionView.collectionViewLayout
            if let photoLayout = layout as? PhotoCollectionViewLayout {
                photoLayout.delegate = self
            }
            collectionView.contentInset = .init(top: 20, left: 20, bottom: 20, right: 20)
        }
    }
    
    private lazy var photos: [Photo] = {
        var photos: [Photo] = []
        for index in 0..<17 {
            for type in [PhotoType.dog, PhotoType.cat] {
                let photo = Photo(imageName: type.rawValue + String(index), photoType: type)
                photos.append(photo)
            }
        }
        photos.shuffle()
        return photos
    }()
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
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        cell.layer.opacity = 0
        cell.alpha = 0
        cell.transform = CGAffineTransform(scaleX: 1.1, y: 1.1).translatedBy(x: 10, y: 0)
        
        UIView.animate(withDuration: 0.45) {
            cell.layer.opacity = 1
            cell.alpha = 1
            cell.transform = .identity
        }
        
        UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 0.45, delay: 0, options: [], animations: {
            cell.layer.opacity = 1
        }, completion: nil)
        
        let animation = UIViewPropertyAnimator(duration: 0.45, curve: .easeInOut) {
            cell.layer.opacity = 1
        }
        animation.addAnimations {
            cell.transform = .identity
        }
        animation.startAnimation()
        
    }
}


// MARK: - PhotoCollectionViewLayoutDelegate

extension ViewController: PhotoCollectionViewLayoutDelegate {
    func photoCollectionView(_ collectionView: UICollectionView, layout collectionViewLayout: PhotoCollectionViewLayout, sizeForPhotoAt indexPath: IndexPath) -> CGSize {
        guard let image = UIImage(named: photos[indexPath.item].imageName) else { return .zero }
        return image.size
    }
}
