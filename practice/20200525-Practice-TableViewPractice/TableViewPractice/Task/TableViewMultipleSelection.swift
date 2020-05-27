//
//  TableViewMultipleSelection.swift
//  TableViewPractice
//
//  Created by giftbot on 2020/05/25.
//  Copyright © 2020 giftbot. All rights reserved.
//

import UIKit

final class TableViewMultipleSelection: UIViewController {
    
    /*
     [ 실습 - TableViewRefresh 기능을 이어서 수행 ]
     
     1) 처음 화면에 띄워질 목록은 1부터 지정한 숫자까지의 숫자들을 출력
     2) 이후 갱신할 때마다 임의의 숫자들이 출력되도록 할 것
     랜덤 숫자의 범위는 출력할 숫자 개수의 +50 이며, 모든 숫자는 겹치지 않아야 함.
     (여기까지 TableViewRefresh 실습 내용과 동일)
     3) 특정 테이블뷰셀을 선택하고 갱신하면 해당 셀에 있던 숫자는 유지되고 나머지 숫자들만 랜덤하게 갱신되도록 처리
     (셀을 선택한 순서에 따라 그대로 다음 갱신 목록에 출력)
     e.g. 20, 10 두 개의 숫자를 선택하고 갱신하면, 다음 숫자 목록은 (20, 10, random, random...)
     4) 위 3번에서 숫자를 선택할 때 그 숫자가 7보다 작은 셀은 선택이 되지 않도록 처리.
     
     < 힌트 키워드 >
     willSelectRowAt - scrollViewDelegate 참고, 선택 가능 여부
     selectedRow(s) - tableView 속성, 현재 선택된 행에 대한 정보
     multipleSelection - 다중 선택 가능 여부
     */
    let selectInt   = 20
    let addDigit    = 50
    lazy var data = Array(1...selectInt)
    lazy var includeDigit: [Int] = []
    
    override var description: String { "Task 1 - MultipleSelection" }
    
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTable()
    }
    
    private func setupTable() {
        view.addSubview(tableView)
        tableView.frame = view.frame
        tableView.dataSource = self
        tableView.delegate = self
        tableView.allowsMultipleSelection = true
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CellID")
        setupRefreshTable()
    }
    
    private func setupRefreshTable() {
        let refreshControl = UIRefreshControl()
        refreshControl.tintColor = .systemPink
        refreshControl.attributedTitle = NSAttributedString(string: "Refreshing...", attributes: [
            .font: UIFont.systemFont(ofSize: 20),
            .foregroundColor: UIColor.systemPink
        ])
        refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
        tableView.refreshControl = refreshControl
    }
    
    @objc private func refresh() {
        data.removeAll()
        data.append(contentsOf: includeDigit)
        
        for _ in 1...(20 - includeDigit.count) {
            data.append(createRandomDigit())
        }
        
        includeDigit.removeAll()
        tableView.refreshControl?.endRefreshing()
        tableView.reloadData()
    }
    
    private func createRandomDigit() -> Int {
        let limitDigit = selectInt + addDigit
        let randomDigit = (1...limitDigit).randomElement()
        
        guard !(data.contains(randomDigit!)) else { return createRandomDigit() }
        return randomDigit!
    }
}

// MARK: - UITableViewDataSource
extension TableViewMultipleSelection: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellID", for: indexPath)
        cell.textLabel?.text = "\(data[indexPath.row])"
        return cell
    }
}

// MARK: - UITableViewDelegate
extension TableViewMultipleSelection: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectDigit = Int((tableView.cellForRow(at: indexPath)?.textLabel?.text)!)!
        includeDigit.append(selectDigit)
        
//        for indexPathValue in tableView.indexPathsForSelectedRows ?? [] {
//            includeDigit.append(indexPathValue.row)
//        }
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let deselectDigit = Int((tableView.cellForRow(at: indexPath)?.textLabel?.text)!)!
        includeDigit.remove(at: includeDigit.firstIndex(of: deselectDigit)!)
    }
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        let willSelectDigit = Int((tableView.cellForRow(at: indexPath)?.textLabel?.text)!)!
        guard willSelectDigit < 7 else { return indexPath }
        return nil
    }
}


