//
//  GeocodeViewController.swift
//  MapKitExample
//
//  Copyright © 2020년 giftbot. All rights reserved.
//

import UIKit
import MapKit


final class GeocodeViewController: UIViewController {

  @IBOutlet private weak var mapView: MKMapView!
  
  @IBAction func recognizeTap(gesture: UITapGestureRecognizer) {
    let touchPoint = gesture.location(in: gesture.view)
    let coordinate = mapView.convert(touchPoint, toCoordinateFrom: mapView)
    let location = CLLocation(latitude: coordinate.latitude, longitude: coordinate.longitude)
    
    reverseGeocode(location: location)
  }
  
  func reverseGeocode(location: CLLocation) {
    let geocoder = CLGeocoder()

    geocoder.reverseGeocodeLocation(location) { placeMark, error in
      print("\n---------- [ 위경도 -> 주소 ] ----------")
      if error != nil {
        return print(error!.localizedDescription)
      }
      
      // 국가별 주소체계에 따라 어떤 속성 값을 가질지 다름
      guard let address = placeMark?.first,
        let country = address.country,
        let administrativeArea = address.administrativeArea,
        let locality = address.locality,
        let name = address.name
        else { return }
      
      let addr = "\(country) \(administrativeArea) \(locality) \(name)"
      print(addr)
    }
  }
  
  
  func geocodeAddressString(_ addressString: String) {
    print("\n---------- [ 주소 -> 위경도 ] ----------")
    let geocoder = CLGeocoder()
    geocoder.geocodeAddressString(addressString) { (placeMark, error) in
      if error != nil {
        return print(error!.localizedDescription)
      }
      guard let place = placeMark?.first else { return }
      print(place)
      
      // 위경도값 가져오기
//      print(place.location?.coordinate)
    }
  }
}





