//
//  ButtonTableViewController.swift
//  BasicTableView
//
//  Created by 천지운 on 2020/05/26.
//  Copyright © 2020 giftbot. All rights reserved.
//

import UIKit

class ButtonTableViewController: UIViewController {

    override var description: String { "TableView - ButtonUP" }
    
    let tableView = UITableView()
    var digitArray = Array(1...50)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupTableView()
    }
    
    private func setupTableView() {
        view.addSubview(tableView)
        tableView.frame = view.frame
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 50
        
//        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellID")
        tableView.register(ButtonTableViewCell.self, forCellReuseIdentifier: "buttonCustomCell")
    }
    
}

extension ButtonTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return digitArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "buttonCustomCell", for: indexPath)
        
//        cell.layer.borderColor = UIColor.black.cgColor
//        cell.layer.borderWidth = 0.5
        
//        cell.textLabel?.text = "\(digitArray[indexPath.row])"
//        cell.imageView?.image = UIImage(named: "bear")
        
        (cell as? ButtonTableViewCell)?.label.text = "\(digitArray[indexPath.row])"
        (cell as? ButtonTableViewCell)?.button.tag = indexPath.row
        (cell as? ButtonTableViewCell)?.button.addTarget(self, action: #selector(clicekdButtonEvent(_:)), for: .touchUpInside)
        return cell
    }
    
    @objc private func clicekdButtonEvent(_ sender: UIButton) {
        digitArray[sender.tag] += 1
        tableView.reloadData()
    }
    
}


extension ButtonTableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        digitArray[indexPath.row] += 1
        tableView.reloadData()
    }
}
