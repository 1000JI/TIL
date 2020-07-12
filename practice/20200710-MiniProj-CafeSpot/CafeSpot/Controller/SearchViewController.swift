//
//  SearchViewController.swift
//  CafeSpot
//
//  Created by 천지운 on 2020/07/10.
//  Copyright © 2020 Giftbot. All rights reserved.
//

import UIKit
import MapKit

class SearchViewController: UIViewController {
    
    // MARK: - Properties
    
    private var isClickedAnnotaion = false 
    
    private var allCafeList = [Cafe]() {
        didSet { collectionView.reloadData() }
    }
    
    private var viewCafeList = [Cafe]() {
        didSet { collectionView.reloadData() }
    }
    
    private var selectedCafeList = [Cafe]() {
        didSet { collectionView.reloadData() }
    }
    
    private let mapView = MKMapView()
    private var mapViewHeightConstrant: NSLayoutConstraint!
    
    private var isClicked = false
    private lazy var showCafeList: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "chevron.up.square"), for: .normal)
        button.tintColor = .darkGray
        button.backgroundColor = .lightGray
        
        button.layer.cornerRadius = 25
        button.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        button.addTarget(self, action: #selector(handleShowCafe), for: .touchUpInside)
        return button
    }()
    
    private let collectionHeightValue: CGFloat = 250
    private let layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        return layout
    }()
    private lazy var collectionView: UICollectionView = {
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.showsHorizontalScrollIndicator = false
        cv.alpha = 0
        return cv
    }()
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureCollectionView()
        fetchCafeList()
    }
    
    // MARK: - Selectors
    
    @objc func handleShowCafe(_ sender: UIButton) {
        isClicked.toggle()
        
        if isClicked {
            sender.setImage(UIImage(systemName: "chevron.down.square"), for: .normal)
            collectionView.alpha = 1
            UIView.animate(withDuration: 0.3) {
                self.mapViewHeightConstrant.constant = -250
                self.view.layoutIfNeeded()
            }
        } else {
            sender.setImage(UIImage(systemName: "chevron.up.square"), for: .normal)
            UIView.animate(withDuration: 0.3) {
                self.mapViewHeightConstrant.constant = 0
                self.collectionView.alpha = 0
                self.view.layoutIfNeeded()
            }
        }
    }
    
    // MARK: - Helpers
    
    func fetchCafeList() {
        CafeService.shared.fetchCafeData { cafeList in
            self.allCafeList = cafeList
        }
        viewCafeList = allCafeList
        configureMap()
    }
    
    func configureCollectionView() {
        collectionView.backgroundColor = .systemBackground
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.register(CafeListCell.self, forCellWithReuseIdentifier: CafeListCell.identifier)
    }
    
    func configureMap() {
        mapView.delegate = self
        
        let coordinate = CLLocationCoordinate2D(latitude: 37.547201, longitude: 127.042270)
        let span = MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        mapView.setRegion(region, animated: false)
        
        allCafeList.forEach {
            let location = MKPointAnnotation()
            location.coordinate = CLLocationCoordinate2D(
                latitude: $0.location.lat,
                longitude: $0.location.lng)
            location.title = $0.title
            mapView.addAnnotation(location)
        }
    }
    
    func configureUI() {
        view.backgroundColor = .systemBackground
        
        view.addSubview(mapView)
        mapView.anchor(top: view.topAnchor, leading: view.leadingAnchor, trailing: view.trailingAnchor)
        
        mapViewHeightConstrant = mapView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        mapViewHeightConstrant.isActive = true
        
        view.addSubview(showCafeList)
        showCafeList.anchor(leading: view.leadingAnchor, bottom: mapView.bottomAnchor, trailing: view.trailingAnchor)
        showCafeList.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        view.addSubview(collectionView)
        collectionView.anchor(top: mapView.bottomAnchor, leading: view.leadingAnchor, trailing: view.trailingAnchor, height: collectionHeightValue)
    }
}

// MARK: - MKMapViewDelegate

extension SearchViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, clusterAnnotationForMemberAnnotations memberAnnotations: [MKAnnotation]) -> MKClusterAnnotation {
        guard memberAnnotations.count > 0 else { return MKClusterAnnotation(memberAnnotations: memberAnnotations) }
        
        let cluster = MKClusterAnnotation(memberAnnotations: memberAnnotations)
        guard let title = memberAnnotations.first?.title as? String else { return cluster }
        cluster.title = title
        return cluster
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        // 죽는거 방지
        if annotation is MKUserLocation { return nil }
        if annotation is MKClusterAnnotation { return nil }
        
        let annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier, for: annotation)
        annotationView.clusteringIdentifier = "identifier"
        return annotationView
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        selectedCafeList.removeAll()
        isClickedAnnotaion = true
        
        guard let annotations = view.annotation as? MKClusterAnnotation else {
            addAnnotationSelectedList(with: view.annotation)
            return
        }
        
        annotations.memberAnnotations.forEach { annotation in
            addAnnotationSelectedList(with: annotation)
        }
    }
    
    func addAnnotationSelectedList(with annotation: MKAnnotation?) {
        guard let annotation = annotation else { return }
        if let annotaionTitle = annotation.title as? String {
            allCafeList.forEach {
                if $0.title.contains(annotaionTitle) {
                    selectedCafeList.append($0)
                    return
                }
            }
        }
    }
    
    func mapView(_ mapView: MKMapView, didDeselect view: MKAnnotationView) {
        selectedCafeList.removeAll()
        isClickedAnnotaion = false
    }
    
    func mapViewDidChangeVisibleRegion(_ mapView: MKMapView) {
        let mRect = mapView.visibleMapRect
        let topPoint = MKMapPoint(x: mRect.minX, y: mRect.minY)
        let bottomPoint = MKMapPoint(x: mRect.maxX, y: mRect.maxY)
        
        viewCafeList.removeAll()
        allCafeList.forEach {
            if $0.location.lat > bottomPoint.coordinate.latitude
                && $0.location.lat < topPoint.coordinate.latitude
                && $0.location.lng > topPoint.coordinate.longitude
                && $0.location.lng < bottomPoint.coordinate.longitude {
                viewCafeList.append($0)
            }
        }
    }
}


// MARK: - UICollectionViewDataSource

extension SearchViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return isClickedAnnotaion ? selectedCafeList.count : viewCafeList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CafeListCell.identifier, for: indexPath) as! CafeListCell
        cell.cafe = isClickedAnnotaion ? selectedCafeList[indexPath.item] : viewCafeList[indexPath.item]
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension SearchViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellSize: CGFloat = collectionHeightValue - 8 - 8
        return CGSize(width: cellSize, height: cellSize)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
    }
}
