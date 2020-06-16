//
//  BasicCodeViewController.swift
//  CollectionViewExample
//
//  Copyright © 2020 giftbot. All rights reserved.
//

import UIKit

final class BasicCodeViewController: UIViewController {
    
    // MARK: - Properties
    
    let itemCount = 100
    var collectionView: UICollectionView!
    var controllerStackView: UIStackView!
    
    // MARK: LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSliders()
        setupCollectionView()
        setupNavigationItem()
    }
    
    // MARK: Setup Views
    
    func setupSliders() {
        // 셀 크기
        let sizeSlider = UISlider()
        sizeSlider.minimumValue = 10
        sizeSlider.maximumValue = 200
        sizeSlider.value = 50
        sizeSlider.tag = 0
        
        // 셀 간격
        let spacingSlider = UISlider()
        spacingSlider.minimumValue = 0
        spacingSlider.maximumValue = 50
        spacingSlider.value = 10
        spacingSlider.tag = 1
        
        // 셀 크기
        let edgeSlier = UISlider()
        edgeSlier.minimumValue = 0
        edgeSlier.maximumValue = 50
        edgeSlier.value = 10
        edgeSlier.tag = 2
        
        let sliders = [sizeSlider, spacingSlider, edgeSlier]
        sliders.forEach {
            $0.addTarget(self, action: #selector(editLayout), for: .valueChanged)
        }
        
        let stackView = UIStackView(arrangedSubviews: sliders)
        view.addSubview(stackView)
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            stackView.widthAnchor.constraint(equalToConstant: 300)
        ])
        controllerStackView = stackView
    }
    
    func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 60, height: 60) // 기본값(50, 50)
        layout.minimumInteritemSpacing = 10 // 기본값 10
        layout.minimumLineSpacing = 20 // 기본값 20
        layout.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5) // .zero
        
        collectionView = UICollectionView(frame: view.frame, collectionViewLayout: layout)
        collectionView.backgroundColor = .systemBackground
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        collectionView.dataSource = self
        view.addSubview(collectionView)
        
        collectionView.translatesAutoresizingMaskIntoConstraints.toggle()
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: controllerStackView.bottomAnchor, constant: 10),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
    
    func setupNavigationItem() {
        view.backgroundColor = .systemBackground
        
        let changeDirection = UIBarButtonItem(
            barButtonSystemItem: .reply,
            target: self,
            action: #selector(changeCollectionViewDirection(_:)))
        
        navigationItem.rightBarButtonItem = changeDirection
    }
    
    
    // MARK: Action
    
    @objc private func changeCollectionViewDirection(_ sender: Any) {
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        let current = layout.scrollDirection
        layout.scrollDirection = current == .horizontal ? .vertical : .horizontal
    }
    
    @objc private func editLayout(_ sender: UISlider) {
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        
        if sender.tag == 0 { // 셀크기
            let size = CGFloat(sender.value)
            layout.itemSize = CGSize(width: size, height: size)
        } else if sender.tag == 1 { // 셀 간격
            layout.minimumLineSpacing = CGFloat(sender.value)
            layout.minimumInteritemSpacing = CGFloat(sender.value)
        } else { // 외부 여백
            let v = CGFloat(sender.value)
            let inset = UIEdgeInsets(top: v, left: v, bottom: v, right: v)
            layout.sectionInset = inset
        }
    }
}


// MARK: - UICollectionViewDataSource

extension BasicCodeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        
        cell.backgroundColor = [.red, .green, .blue, .magenta, .gray, .cyan, .orange].randomElement()
        
        return cell
    }
}
