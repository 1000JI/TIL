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
        tableView.rowHeight = 60
        
//        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellID")
        tableView.register(ButtonTableViewCell.self, forCellReuseIdentifier: "buttonCustomCell")
    }
    
}

extension ButtonTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return digitArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "buttonCustomCell", for: indexPath) as! ButtonTableViewCell
        
        // 1) 액션을 통한 처리 방법
        // 최초 생성 여부 구분
        if cell.textLabel?.text == nil {
            cell.button.addTarget(self, action: #selector(clicekdButtonEvent(_:)), for: .touchUpInside)
        }
        
        cell.label.text = "\(digitArray[indexPath.row])"
        cell.button.tag = indexPath.row
        
        return cell
    }
    
    @objc private func clicekdButtonEvent(_ sender: UIButton) {
//        digitArray[sender.tag] += 1
//        tableView.reloadData()
        
        // 1번째 방법 tag 이용하기
        let indexPath = IndexPath(row: sender.tag, section: 0)
        
        if let cell = tableView.cellForRow(at: indexPath) as? ButtonTableViewCell {
            digitArray[sender.tag] += 1
            cell.label.text = "\(digitArray[sender.tag])"
        }
        
        // 2번째 방법 SuperView로 가져오기
        // rootView -> tableView -> cell -> contentView -> button
//        if let cell = sender.superview?.superview as? ButtonTableViewCell,
//            let row = tableView.indexPath(for: cell)?.row {
//                digitArray[row] += 1
//                cell.label.text = "\(digitArray[row])"
//        }
    }
    
}

extension ButtonTableViewController: CustomCellDelegate {
    // 2) Delegate 이용 방법
    func customCell(_ cell: ButtonTableViewCell, selectedRow row: Int) {
        // 태그를 사용하지 않았을 때
//        guard let row = tableView.indexPath(for: cell)?.row else { return }
        
        digitArray[row] += 1
        cell.label.text = "\(digitArray[row])"
    }
}
