//
//  BasicAnnotationViewController.swift
//  MapKitExample
//
//  Copyright © 2020년 giftbot. All rights reserved.
//

import MapKit
import UIKit

final class BasicAnnotationViewController: UIViewController {
  
  @IBOutlet private weak var mapView: MKMapView!
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
  }
  
  func setRegion(coordinate: CLLocationCoordinate2D) {
  }
  
  @IBAction private func addAnnotation(_ sender: Any) {
  }
  
  @IBAction private func moveToRandomPin(_ sender: Any) {
  }
  
  @IBAction private func removeAnnotation(_ sender: Any) {
  }
  
  @IBAction private func setupCamera(_ sender: Any) {
  }
}
