//
//  GestureViewController.swift
//  GestureRecognizerExample
//
//  Copyright © 2020 Giftbot. All rights reserved.
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
  
  @IBAction private func handleTapGesture(_ sender: UITapGestureRecognizer) {
    guard sender.state == .ended else { return }
    
    if !isQuadruple {
      UIView.animate(withDuration: 1, animations: {
        self.imageView.transform = CGAffineTransform(scaleX: 2.0, y: 2.0)
      })
    } else {
      UIView.animate(withDuration: 1) {
        self.imageView.transform = .identity
      }
    }
    isQuadruple.toggle()
  }
  
  
  // MARK: Rotation
  
  @IBAction private func handleRotationGesture(_ sender: UIRotationGestureRecognizer) {
    guard sender.state == .began || sender.state == .changed else { return }
    
    imageView.transform = imageView.transform.rotated(by: sender.rotation)
    print(sender.rotation)
    sender.rotation = 0
  }
  
  
  // MARK: Swipe
  
  @IBAction private func handleSwipeGesture(_ sender: UISwipeGestureRecognizer) {
    print(sender)
    guard sender.state == .ended else { return }
    if sender.direction == .right {
      imageView.image = UIImage(named: "cat1")
      sender.direction = .left
    } else if sender.direction == .left {
      imageView.image = UIImage(named: "cat2")
      sender.direction = .right
    }
  }
  
}
