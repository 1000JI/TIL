//
//  ViewController.swift
//  Test3Starter
//
//  Created by Lee on 2020/07/03.
//  Copyright © 2020 Kira. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    // MARK: - LifeCycle
    
    private var menusTitle = [String]()
    private var menuProducts = [[[String:Any]]]()
    private lazy var menuPoint = [CGPoint]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureTableView()
        fetchMenus()
    }
    
    // MARK: - Helpers
    
    func configureUI() {
        self.title = "Domino's"
    }
    
    func configureTableView() {
        tableView.tableFooterView = UIView()
        tableView.rowHeight = 650
        tableView.register(CustomCell.self, forCellReuseIdentifier: CustomCell.identifier)
    }
    
    func fetchMenus() {
        dominoData.forEach {
            guard let title = $0["카테고리"] as? String else { return }
            guard let menu = $0["메뉴"] as? [[String:Any]] else { return }
            
            self.menusTitle.append(title)
            self.menuProducts.append(menu)
            self.menuPoint.append(CGPoint(x: 0, y: 0))
        }
        tableView.reloadData()
    }
}

// MARK: - UITalbeViewDataSource

extension ViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menusTitle.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomCell.identifier, for: indexPath) as! CustomCell
        cell.configureCell(title: menusTitle[indexPath.row],
                           products: menuProducts[indexPath.row])
        return cell
    }
}


extension ViewController {
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let customCell = cell as! CustomCell
        customCell.collectionView.contentOffset = menuPoint[indexPath.row]
    }
    
    override func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let customCell = cell as! CustomCell
        menuPoint[indexPath.row] = customCell.collectionView.contentOffset
    }
}
