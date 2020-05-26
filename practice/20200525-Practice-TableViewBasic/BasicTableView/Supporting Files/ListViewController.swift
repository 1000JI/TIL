//
//  ListViewController.swift
//  BasicTableView
//
//  Created by Giftbot on 2020/05/25.
//  Copyright © 2020 giftbot. All rights reserved.
//

import UIKit

final class ListViewController: UIViewController {
    var viewControllers: [UIViewController] = []
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewControllers = [
            TableViewBasic(),
            TableViewLifeCycle(),
            TableViewSection(),
            TableViewRefresh(),
            TableViewCellStyle(),
            TableViewCustomCell(),
            TableViewEditing(),
            ButtonTableViewController()
        ]
    }
}


// MARK: - UITableViewDataSource

extension ListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewControllers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "list", for: indexPath)
        cell.textLabel?.text = "\(viewControllers[indexPath.row].classForCoder)"
        return cell
    }
}

// MARK: - UITableViewDelegate

extension ListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = viewControllers[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
}

