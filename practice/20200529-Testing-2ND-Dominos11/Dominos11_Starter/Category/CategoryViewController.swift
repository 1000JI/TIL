//
//  CategoryViewController.swift
//  Dominos11_Starter
//
//  Created by Lee on 2020/05/26.
//  Copyright © 2020 Kira. All rights reserved.
//

import UIKit

class CategoryViewController: UIViewController {
    
    let categoryTableView = UITableView()
    
    // MARK: viewDidLoad()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLayout()
        setupTableView()
    }
    
    // MARK: - setup Method()
    private func setupTableView() {
        categoryTableView.rowHeight = 100
        categoryTableView.dataSource = self
        
        let headerView = CategoryHeaderView()
        headerView.frame.size = CGSize(width: 100, height: 300)
        categoryTableView.tableHeaderView = headerView
        
        categoryTableView.register(CategoryTableViewCell.self, forCellReuseIdentifier: "categoryCell")
    }
    
    private func setupLayout() {
        self.title = "Domino's"
        
        view.addSubview(categoryTableView)
        categoryTableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            categoryTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            categoryTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0),
            categoryTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            categoryTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0)
        ])
    }
}

// MARK: - TableView DataSource
extension CategoryViewController: UITableViewDataSource {
    // MARK: numberOfRowsInSection
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SaveProduct.categoryTitle.count
    }
    
    // MARK: cellForRowAt
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "categoryCell", for: indexPath) as! CategoryTableViewCell
        
        cell.backgroundButton.tag = indexPath.row
        cell.backgroundButton.setBackgroundImage(UIImage(named: "\(SaveProduct.categoryTitle[indexPath.row])"), for: .normal)
        cell.backgroundButton.addTarget(self, action: #selector(clickedCategoryEvent), for: .touchUpInside)
        
        cell.textLabel?.text = "\(SaveProduct.categoryTitle[indexPath.row])"
        return cell
    }
    
    // MARK: Button Action) clickedCategoryEvent
    @objc private func clickedCategoryEvent(_ sender: UIButton) {
        let productVC = ProductViewController()
        productVC.title = SaveProduct.categoryTitle[sender.tag]
        productVC.productMenus = SaveProduct.product[SaveProduct.categoryTitle[sender.tag]]!
        self.navigationController?.pushViewController(productVC, animated: true)
    }
    
}

