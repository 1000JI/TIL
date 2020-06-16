//
//  ReorderingViewController.swift
//  CollectionViewExample
//
//  Copyright © 2020 giftbot. All rights reserved.
//

import UIKit

final class ReorderingViewController: UIViewController {

  let _images = ParkManager.imageNames(of: .nationalPark)
  lazy var parkImages = Array(repeating: _images, count: 5).flatMap { $0 }
  
  let layout = UICollectionViewFlowLayout()
  
  // MARK: - View Lifecycle

  override func viewDidLoad() {
    super.viewDidLoad()
    setupFlowLayout()
  }


  // MARK: Setup FlowLayout

  func setupFlowLayout() {
  }

  // MARK: Setup Gesture
  
  
  
  
  // MARK: - Action

  @objc private func reorderCollectionViewItem(_ sender: UILongPressGestureRecognizer) {
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
    cell.backgroundColor = .black
    return cell
  }
}


