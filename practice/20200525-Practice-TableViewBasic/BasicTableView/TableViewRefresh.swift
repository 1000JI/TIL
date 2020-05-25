//
//  TableView03.swift
//  BasicTableView
//
//  Created by Giftbot on 2020/05/25.
//  Copyright © 2020 giftbot. All rights reserved.
//

import UIKit

final class TableViewRefresh: UIViewController {
    
    override var description: String { "TableView - Refresh" }
    
    /***************************************************
     테이블뷰를 새로 불러올 때마다 숫자 목록을 반대로 뒤집어서 출력하기
     ***************************************************/
    
    let tableView = UITableView()
    var data = Array(1...40)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Refresh"
        setupTableView()
        
        // 1) 버튼 만들어서 갱신
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "Refresh", style: .plain, target: self,
            action: #selector(reloadData)
        )
    }
    
    func setupTableView() {
        tableView.frame = view.frame
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CellId")
        view.addSubview(tableView)
        
        // 2) Pull to Refresh
        let refreshControl = UIRefreshControl()
        refreshControl.tintColor = .red
        refreshControl.attributedTitle = NSAttributedString(string: "Refreshing...")
        refreshControl.addTarget(self, action: #selector(reloadData), for: .valueChanged)
        
        let attrStr = NSAttributedString(
            string: "Refreshing...",
            attributes: [
                .font: UIFont.systemFont(ofSize: 25),
                .foregroundColor: UIColor.black,
                .kern: 6 // 글자 간격
        ])
        refreshControl.attributedTitle = attrStr
        tableView.refreshControl = refreshControl
        
        // Row 높이
        tableView.rowHeight = 60
    }
    
    @objc func reloadData() {
        data.reverse()
        tableView.refreshControl?.endRefreshing()
        tableView.reloadData()
    }
}

// MARK: - UITableViewDataSource

extension TableViewRefresh: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellId", for: indexPath)
        cell.textLabel?.text = "\(data[indexPath.row])"
        return cell
    }
}
