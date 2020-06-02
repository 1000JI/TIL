//
//  ProductViewController.swift
//  Dominos11_Starter
//
//  Created by Lee on 2020/05/26.
//  Copyright © 2020 Kira. All rights reserved.
//

import UIKit

class ProductViewController: UIViewController {
    
    private let productTableView = UITableView()
    var productMenus: [String : [String : Any]] = [:]
    lazy var productTitles: [String] = productMenus.keys.sorted()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLayout()
        setupTableView()
    }
    
    private func setupLayout() {
        view.addSubview(productTableView)
        productTableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            productTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            productTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0),
            productTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            productTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0)
        ])
    }
    
    private func setupTableView() {
        productTableView.rowHeight = 120
        productTableView.dataSource = self
        productTableView.delegate = self
    }
}

// MARK: - UITableViewDataSource
extension ProductViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productTitles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Subtitle")
        ?? UITableViewCell(style: .subtitle, reuseIdentifier: "Subtitle")
        
        cell.textLabel?.text = "\(productTitles[indexPath.row])"
        
        let picName = productMenus[productTitles[indexPath.row]]!["사진"]
        cell.imageView?.image = UIImage(named: "\(picName!)")
        
        let price = productMenus[productTitles[indexPath.row]]!["가격"]
        cell.detailTextLabel?.text = "\(price!)원"
        
        return cell
    }
}

// MARK: - UITableViewDelegate
extension ProductViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = DetailViewController()
        
        detailVC.title = "\(productTitles[indexPath.row])"
        detailVC.orderName = "\(productTitles[indexPath.row])"
        
        let price = productMenus[productTitles[indexPath.row]]!["가격"]
        detailVC.orderPrice = (price as! Int)
        
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
}
