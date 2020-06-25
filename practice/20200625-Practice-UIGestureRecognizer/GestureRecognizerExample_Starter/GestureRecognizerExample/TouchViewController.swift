//
//  TouchViewController.swift
//  GestureRecognizerExample
//
//  Copyright © 2020 Giftbot. All rights reserved.
//

import UIKit

final class TouchViewController: UIViewController {
  
  @IBOutlet private weak var imageView: UIImageView! {
    didSet {
      imageView.layer.cornerRadius = imageView.bounds.width / 2
      imageView.clipsToBounds = true
    }
  }
  var isHoldingImage = false
  var lastTouchPoint = CGPoint.zero
  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    super.touchesBegan(touches, with: event)
    guard let touch = touches.first else { return }
    let touchPoint = touch.location(in: touch.view)
    print("DEBUG: touchesBegan TouchPoint => \(touchPoint)")
    
//    let startX = imageView.frame.origin.x
//    let endX = imageView.frame.origin.x + imageView.frame.width
//    let startY = imageView.frame.origin.y
//    let endY = imageView.frame.origin.y + imageView.frame.height
//
//    if touchPoint.x > startX && touchPoint.x < endX &&
//      touchPoint.y > startY && touchPoint.y < endY {
//      imageView.image = UIImage(named: "cat2")
//    }
    
    if imageView.frame.contains(touchPoint) {
      imageView.image = UIImage(named: "cat2")
      isHoldingImage = true
      lastTouchPoint = touchPoint
    }
  }
  
  override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
    super.touchesMoved(touches, with: event)
    guard let touch = touches.first else { return }
    let touchPoint = touch.location(in: touch.view)
//    print("DEBUG: touchesMoved TouchPoint => \(touchPoint)")
    
//    if imageView.frame.contains(touchPoint) {
//      imageView.center = touchPoint
//    }
    
    let prevTouchPoint = touch.previousLocation(in: touch.view)
    imageView.center.x = imageView.center.x + (touchPoint.x - prevTouchPoint.x)
    imageView.center.y = imageView.center.y + (touchPoint.y - prevTouchPoint.y)
  }
  
  override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    super.touchesEnded(touches, with: event)
    guard let touch = touches.first else { return }
    let touchPoint = touch.location(in: touch.view)
    print("DEBUG: touchesEnded TouchPoint => \(touchPoint)")
    
    guard isHoldingImage else { return }
    isHoldingImage.toggle()
    imageView.image = UIImage(named: "cat1")
  }
  
  // MARK: - App LifeCylce(Inactive 상태 일 경우)
  // 시스템 인터럽션, 터치 주인 뷰가 제거 될때 등
  override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
    super.touchesCancelled(touches, with: event)
    guard let touch = touches.first else { return }
    let touchPoint = touch.location(in: touch.view)
    print("DEBUG: touchesCancelled TouchPoint => \(touchPoint)")
    
    isHoldingImage.toggle()
    imageView.image = UIImage(named: "cat1")
  }
  
  
  // MARK: Motion
  
  override func motionBegan(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
    super.motionBegan(motion, with: event)
    if motion == .motionShake {
      imageView.image = UIImage(named: "cat2")
    }
  }
  
  override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
    super.motionEnded(motion, with: event)
    if motion == .motionShake {
      imageView.image = UIImage(named: "cat1")
    }
  }

  override func motionCancelled(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
    super.motionCancelled(motion, with: event)
    if motion == .motionShake {
      imageView.image = UIImage(named: "cat1")
    }
  }
}



