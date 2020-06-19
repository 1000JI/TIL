//
//  ReorderingViewController.swift
//  CollectionViewExample
//
//  Copyright © 2020 giftbot. All rights reserved.
//

import UIKit

final class ReorderingViewController: UIViewController {
    
    // MARK: - Properties
    
    let _images = ParkManager.imageNames(of: .nationalPark)
    lazy var parkImages = Array(repeating: _images, count: 5).flatMap { $0 }
    
    let layout = UICollectionViewFlowLayout()
    lazy var collectionView: UICollectionView = {
        let cv = UICollectionView(
            frame: view.frame,
            collectionViewLayout: layout
        )
        cv.backgroundColor = .white
        cv.dataSource = self
        cv.register(CustomCell.self, forCellWithReuseIdentifier: CustomCell.identifier)
        view.addSubview(cv)
        return cv
    }()
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupFlowLayout()
        setupLongPressGestureRecognizer()
    }
    
    
    // MARK: Setup FlowLayout
    
    func setupFlowLayout() {
        let itemsInLine: CGFloat = 4
        let spacing: CGFloat = 10.0
        let insets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        let cvWidth = collectionView.frame.width
        let contentSize = cvWidth - insets.left - insets.right - (spacing * (itemsInLine - 1))
        let itemSize = (contentSize / itemsInLine).rounded(.down) // 소수점 자리를 없애는 것
        print("DEBUG: ", (contentSize / itemsInLine), itemSize)
        
        layout.minimumInteritemSpacing = spacing
        layout.minimumLineSpacing = spacing
        layout.sectionInset = insets
        layout.itemSize = CGSize(width: itemSize, height: itemSize)
    }
    
    // MARK: Setup Gesture
    
    func setupLongPressGestureRecognizer() {
        let gesture = UILongPressGestureRecognizer(
            target: self,
            action: #selector(reorderCollectionViewItem(_:))
        )
        collectionView.addGestureRecognizer(gesture)
    }
    
    // MARK: - Action
    
    @objc private func reorderCollectionViewItem(_ sender: UILongPressGestureRecognizer) {
        let location = sender.location(in: collectionView)
        switch sender.state {
        case .began:
            guard let indexPath = collectionView.indexPathForItem(at: location) else { break }
            collectionView.beginInteractiveMovementForItem(at: indexPath)
//            UIView.setAnimationsEnabled(false)
        case .changed:
            collectionView.updateInteractiveMovementTargetPosition(location)
        case .cancelled:
            collectionView.cancelInteractiveMovement()
        case .ended:
            collectionView.endInteractiveMovement()
//            UIView.setAnimationsEnabled(true)
        default:
            break
        }
    }
}

// MARK: - UICollectionViewDataSource

extension ReorderingViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return parkImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: CustomCell.identifier, for: indexPath
            ) as! CustomCell
        let item = indexPath.item
        cell.configure(image: UIImage(named: parkImages[item]), title: parkImages[item])
        cell.backgroundColor = .black
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, moveItemAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        guard sourceIndexPath != destinationIndexPath else { return }
        let source = sourceIndexPath.item
        let destination = destinationIndexPath.item
        print("source \(source) / destination \(destination)")
        
        let element = parkImages.remove(at: source)
        parkImages.insert(element, at: destination)
    }
}


