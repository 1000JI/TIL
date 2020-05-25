//
//  TableView02.swift
//  BasicTableView
//
//  Created by Giftbot on 2020/05/25.
//  Copyright © 2020 giftbot. All rights reserved.
//

import UIKit

final class TableViewSection: UIViewController {
    
    override var description: String { "TableView - Section" }
    
    /*
     섹션을 나누어 데이터 목록 출력하기
     */
    
    lazy var sectionTitles: [String] = fruitsDict.keys.sorted()
    let fruitsDict = [
        "A": ["Apple", "Avocado"],
        "B": ["Banana", "Blackberry"],
        "C": ["Cherry", "Coconut"],
        "D": ["Durian"]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tableView = UITableView(frame: view.frame)
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CellId")
        view.addSubview(tableView)
    }
}


// MARK: - UITableViewDataSource

extension TableViewSection: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        sectionTitles.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        sectionTitles[section]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // sectionTitles[section] - ["A", "B", "C", "D"]
        // fruitsDict["A"] - ["Apple", "Avocado"].count
        // fruitsDict["B"] - ["Banana", "Blackberry"].count
        fruitsDict[sectionTitles[section]]!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellId", for: indexPath)
        let fruits = fruitsDict[sectionTitles[indexPath.section]]!
        cell.textLabel?.text = "\(fruits[indexPath.row])"
        // Apple - IndexPath(section: 0, row: 0)
        // Avocado - IndexPath(section: 0, row: 1)
        // Banana - IndexPath(section: 1, row: 0)
        return cell
    }
}
