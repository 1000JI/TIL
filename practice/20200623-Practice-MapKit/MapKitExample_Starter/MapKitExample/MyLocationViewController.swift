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
    
    locationManager.delegate = self
    
    // 권한 요청
    checkAuthorizationStatus()
    
    mapView.showsUserLocation = true
    mapView.mapType = .satellite
  }
  
  
  func checkAuthorizationStatus() {
    switch CLLocationManager.authorizationStatus() {
    case .notDetermined:
      locationManager.requestWhenInUseAuthorization()
    case .restricted, .denied: break
    case .authorizedWhenInUse:
      fallthrough
    case .authorizedAlways:
      startUpdatingLocation()
    @unknown default:
      // @unknown은 개발자에게 알려주는? 케이스가 더 추가 될 수도 있는 상태기 때문에 표시를 해놓음
      fatalError()
    }
  }
  
  func startUpdatingLocation() {
    let status = CLLocationManager.authorizationStatus()
    guard status == .authorizedAlways || status == .authorizedWhenInUse,
      CLLocationManager.locationServicesEnabled() else { return }
    
    locationManager.desiredAccuracy = kCLLocationAccuracyBest // Best일 때 전력 소모 큼
    locationManager.distanceFilter = 10.0 // FilterNone이 자주 요청함
    locationManager.startUpdatingLocation()
  }
  
  @IBAction func mornitoringHeading(_ sender: Any) {
    guard CLLocationManager.headingAvailable() else { return }
    locationManager.startUpdatingHeading()
  }
  
  @IBAction func stopMornitoring(_ sender: Any) {
    locationManager.stopUpdatingHeading()
  }
}


extension MyLocationViewController: CLLocationManagerDelegate {
  func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
    switch status {
    case .authorizedWhenInUse, .authorizedAlways:
      print("Authorized")
    default:
      print("unauthorized")
    }
  }
  
  func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    let current = locations.last!
    
    if (abs(current.timestamp.timeIntervalSinceNow) < 10) {
      let coordinate = current.coordinate // 위경도
      
      // 내가 있는 곳을 어느정도의 크기로 보여줄지를 정해줄 수 있음
      // Span 단위가 1도
      // 경도 1도는 약 111km.
      // 위도 1도는 경도에 따라 다름. 적도(약 111km) ~ 극지방 0km)
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
  
  func locationManager(_ manager: CLLocationManager, didUpdateHeading newHeading: CLHeading) {
    print("trueHeading :", newHeading.trueHeading) // 진짜 북쪽(진북)
    print("magneticHeading :", newHeading.magneticHeading) // 자기장이 쎈 쪽을 북쪽?(자북)
  }
}
