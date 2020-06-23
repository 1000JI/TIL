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
  private let locationManager = CLLocationManager()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    locationManager.delegate = self
    
    checkAuthorizationStatus()
    
    mapView.showsUserLocation = true
    mapView.mapType = .satellite
  }
  
  
  private func checkAuthorizationStatus() {
    switch CLLocationManager.authorizationStatus() {
    case .notDetermined:
      locationManager.requestWhenInUseAuthorization()
    case .restricted, .denied: break
    case .authorizedWhenInUse:
      fallthrough
    case .authorizedAlways:
      startUpdatingLocation()
    @unknown default: fatalError()
    }
  }
  
  private func startUpdatingLocation() {
    let status = CLLocationManager.authorizationStatus()
    guard status == .authorizedAlways || status == .authorizedWhenInUse,
      CLLocationManager.locationServicesEnabled()
      else { return }
    locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
    locationManager.distanceFilter = 10.0
    locationManager.startUpdatingLocation()
  }
  
  
  // 방향 모니터링은 시뮬레이터에서 수행 X
  @IBAction private func mornitoringHeading(_ sender: Any) {
    guard CLLocationManager.headingAvailable() else { return }
    locationManager.startUpdatingHeading()
  }
  
  @IBAction private func stopMornitoring(_ sender: Any) {
    locationManager.stopUpdatingHeading()
  }
}


// MARK: - CLLocationManagerDelegate

extension MyLocationViewController: CLLocationManagerDelegate {
  func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
    switch status {
    case .authorizedWhenInUse, .authorizedAlways:
      print("Authorized")
    default:
      print("Unauthorized")
    }
  }
  
  func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    let current = locations.last!
    
    if (abs(current.timestamp.timeIntervalSinceNow) < 10) {
      let coordinate = current.coordinate
      
      // Span 단위는 1도
      // 경도 1도는 약 111킬로미터. 위도 1도는 위도에 따라 변함.
      // 적도 (약 111 Km) ~ 극지방 (0 Km)
      let span = MKCoordinateSpan(latitudeDelta: 0.002, longitudeDelta: 0.002)
      let region = MKCoordinateRegion(center: coordinate, span: span)
      mapView.setRegion(region, animated: true)
      
      addAnnotation(location: current)
    }
  }
  
  func addAnnotation(location: CLLocation) {
    let annotation = MKPointAnnotation()
    annotation.title = "MyLocation"
    annotation.coordinate = location.coordinate
    mapView.addAnnotation(annotation)
  }
  
  func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
    // 에러 처리
  }
  
  func locationManager(_ manager: CLLocationManager, didUpdateHeading newHeading: CLHeading) {
    print("trueHeading :", newHeading.trueHeading)  // 진북
    print("magneticHeading :", newHeading.magneticHeading)  // 자북
  }
}
