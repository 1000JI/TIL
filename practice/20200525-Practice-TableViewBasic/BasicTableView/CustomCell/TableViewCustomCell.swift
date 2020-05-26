//
//  TableViewCustomCell.swift
//  BasicTableView
//
//  Created by Giftbot on 2020/05/25.
//  Copyright © 2020 giftbot. All rights reserved.
//

import UIKit

final class TableViewCustomCell: UIViewController {
    
    /***************************************************
     커스텀 셀 사용하기
     ***************************************************/
    
    override var description: String { "TableView - CustomCell" }
    
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.frame = view.frame
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 80
        view.addSubview(tableView)
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Default")
        tableView.register(CustomCell.self, forCellReuseIdentifier: "Custom")
    }
}

// MARK: - UITableViewDataSource

extension TableViewCustomCell: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell
        
        if indexPath.row.isMultiple(of: 2) {
            cell = tableView.dequeueReusableCell(withIdentifier: "Custom", for: indexPath)
            (cell as? CustomCell)?.myLabel.text = "ABCDE"
        } else {
            cell = tableView.dequeueReusableCell(withIdentifier: "Default", for: indexPath)
        }
        
        cell.textLabel?.text = "\(indexPath.row * 1000)"
        cell.imageView?.image = UIImage(named: "bear")
        
        return cell
    }
}


// MARK: - UITableViewDelegate

extension TableViewCustomCell: UITableViewDelegate {
    
    // cellForRowAt -> willDisplayCell -> layoutSubviews
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let customCell = cell as? CustomCell else { return }
        customCell.myLabel.frame = CGRect(
            x: cell.frame.width - 120, y: 15,
            width: 100, height: cell.frame.height - 30
        )
    }
    
}

