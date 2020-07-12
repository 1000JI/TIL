//
//  DetailMapCell.swift
//  CafeSpot
//
//  Created by 천지운 on 2020/07/11.
//  Copyright © 2020 Giftbot. All rights reserved.
//

import UIKit
import MapKit

class DetailMapCell: UITableViewCell {
    
    // MARK: - Properties
    
    static let identifier = "DetailMapCell"
    var cafe: Cafe?
    
    private let titleImage: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(systemName: "map")
        iv.tintColor = .label
        iv.setDimensions(width: 36, height: 36)
        return iv
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "위치 정보"
        label.font = .systemFont(ofSize: 28)
        label.textAlignment = .left
        return label
    }()
    
    private let mapView = MKMapView()
    
    // MARK: - LifeCycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
        checkAuthorizationStatus()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        configureMapView()
    }
    
    // MARK: - Helpers
    
    
    func checkAuthorizationStatus() {
        switch CLLocationManager.authorizationStatus() {
        case .notDetermined:
            return
        case .restricted, .denied: break
        case .authorizedWhenInUse:
            fallthrough
        case .authorizedAlways:
            break
        @unknown default:
            fatalError()
        }
    }
    
    func configureMapView() {
        guard let cafe = cafe else { return }
        let cafeLocation = MKPointAnnotation()
        cafeLocation.title = cafe.title
        
        let coordinate = CLLocationCoordinate2D(latitude: cafe.location.lat, longitude: cafe.location.lng)
        cafeLocation.coordinate = coordinate
        mapView.addAnnotation(cafeLocation)
        
        let span = MKCoordinateSpan(latitudeDelta: 0.0008, longitudeDelta: 0.0008)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        mapView.setRegion(region, animated: false)
    }
    
    func configureUI() {
        backgroundColor = .systemBackground
        
        let stack = UIStackView(arrangedSubviews: [titleImage, titleLabel])
        stack.axis = .horizontal
        stack.spacing = 12
        stack.distribution = .fillProportionally
        
        addSubview(stack)
        stack.anchor(top: topAnchor, leading: leadingAnchor, trailing: trailingAnchor, paddingTop: 24, paddingLeading: 24, paddingTrailing: 24)
        
        addSubview(mapView)
        mapView.anchor(top: stack.bottomAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, paddingTop: 24, paddingBottom: 20)
    }
    
}
