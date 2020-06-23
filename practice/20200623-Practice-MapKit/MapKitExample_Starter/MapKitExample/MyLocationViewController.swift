//
//  MyLocationViewController.swift
//  MapKitExample
//
//  Copyright © 2020년 giftbot. All rights reserved.
//

import MapKit
import UIKit

final class MyLocationViewController: UIViewController {
  
  @IBOutlet private weak var mapView: MKMapView!
  let locationManager = CLLocationManager()
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  
  func checkAuthorizationStatus() {
  }
  
  func startUpdatingLocation() {
  }
  
  @IBAction func mornitoringHeading(_ sender: Any) {
  }
  
  @IBAction func stopMornitoring(_ sender: Any) {
  }
}

