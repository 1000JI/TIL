//
//  TableViewEditing.swift
//  BasicTableView
//
//  Created by Giftbot on 2020/05/25.
//  Copyright © 2020 giftbot. All rights reserved.
//

import UIKit

final class TableViewEditing: UIViewController {
    
    /***************************************************
     테이블뷰 목록 수정하기 (insert, delete 등)
     ***************************************************/
    
    override var description: String { "TableView - Editing" }
    
    let tableView = UITableView()
    var data = Array(1...50)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "Edit", style: .plain, target: self, action: #selector(switchToEditing)
        )
    }
    
    func setupTableView() {
        tableView.frame = view.frame
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CellId")
        view.addSubview(tableView)
        
        let refreshControl = UIRefreshControl()
        refreshControl.attributedTitle = NSAttributedString(string: "Refreshing...")
        refreshControl.tintColor = .blue
        refreshControl.addTarget(self, action: #selector(reloadData), for: .valueChanged)
        tableView.refreshControl = refreshControl
    }
    
    @objc func reloadData() {
        tableView.refreshControl?.endRefreshing()
        tableView.reloadData()
    }
    
    @objc func switchToEditing() {
        //        tableView.isEditing
        tableView.setEditing(!tableView.isEditing, animated: true)
    }
}

// MARK: - UITableViewDataSource

extension TableViewEditing: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(#function)
        
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print(#function)
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellId", for: indexPath)
        cell.textLabel?.text = "\(data[indexPath.row])"
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        print(#function)
        
        switch editingStyle {
        case .none: print("nono")
            
        case .delete:
            data.remove(at: indexPath.row) // 먼저 데이터를 지워줘야 한다.
            tableView.deleteRows(at: [indexPath], with: .automatic)
            
        case .insert:
            data.insert(data.randomElement()!, at: indexPath.row)
            tableView.insertRows(at: [indexPath], with: .automatic) // reload 같은?
        default: break
        }
    }
}


// MARK: - UITableViewDelegate

extension TableViewEditing: UITableViewDelegate {
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        print(#function)
        //        return .delete // 기본 값
        
        let row = indexPath.row
        
        if row.isMultiple(of: 3) {
            return .none
        } else if row % 3 == 1 {
            return .delete
        } else {
            return .insert
        }
    }
    
    // trailing Swipe Action > commit EditingStyle
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let addAction = UIContextualAction(style: .normal, title: "ADD") { (action, sourceView, actionPerformed) in
            print("Add Action")
            actionPerformed(true)
        }
        let configuration = UISwipeActionsConfiguration(actions: [addAction])
        configuration.performsFirstActionWithFullSwipe = false // 눌러야만 실행 가능하게 할 때
        return configuration
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let addAction = UIContextualAction(style: .normal, title: "ADD") { (action, sourceView, actionPerformed) in
            print("Add Action")
            actionPerformed(true)
        }
        let configuration = UISwipeActionsConfiguration(actions: [addAction])
        configuration.performsFirstActionWithFullSwipe = false // 눌러야만 실행 가능하게 할 때
        return configuration
    }
}

