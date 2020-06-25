//
//  GestureViewController.swift
//  GestureRecognizerExample
//
//  Copyright © 2020 giftbot. All rights reserved.
//

import UIKit


final class GestureViewController: UIViewController {
  
  @IBOutlet private weak var imageView: UIImageView! {
    didSet {
      imageView.layer.cornerRadius = imageView.frame.width / 2
      imageView.clipsToBounds = true
    }
  }
  var isQuadruple = false
  
  
  // MARK: Tap
  
  @IBAction private func handleTapGesture(_ sender: UITapGestureRecognizer) {
    guard sender.state == .ended else { return }
    
    if !isQuadruple {
      imageView.transform = imageView.transform.scaledBy(x: 2, y: 2)
    } else {
      imageView.transform = .identity
    }
    isQuadruple = !isQuadruple
  }
  
  
  // MARK: Rotation
  
  @IBAction private func handleRotationGesture(_ sender: UIRotationGestureRecognizer) {
    guard sender.state == .began || sender.state == .changed else { return }
    imageView.transform = imageView.transform.rotated(by: sender.rotation)
    sender.rotation = 0
  }
  
  
  // MARK: Swipe

  @IBAction private func handleSwipeGesture(_ sender: UISwipeGestureRecognizer) {
    guard sender.state == .ended else { return }
    
    if sender.direction == .left {
      imageView.image = UIImage(named: "cat1")
      sender.direction = .right
    } else {
      imageView.image = UIImage(named: "cat2")
      sender.direction = .left
    }
  }
}
