//
//  TableViewSection.swift
//  TableViewPractice
//
//  Created by giftbot on 2020/05/25.
//  Copyright © 2020 giftbot. All rights reserved.
//

import UIKit

final class TableViewSection: UIViewController {
    
    /***************************************************
     Data :  x ~ y까지의 숫자 (x, y는 임의의 숫자) (10 ~ 50, 60 ~ 78, 0 ~ 100)
     섹션 타이틀을 10의 숫자 단위로 설정하고 각 섹션의 데이터는 해당 범위 내의 숫자들로 구성
     
     e.g.
     섹션 0 - 0부터 9까지의 숫자
     섹션 1 - 10부터 19까지의 숫자
     ...
     
     let data = [5, 7, 16, 19, 22, 29, 30, 39, 44, 48, 50]
     위 데이터가 주어지면
     섹션 0 - 5, 7
     섹션 1 - 16, 19
     섹션 2 - 22, 29
     ...
     ***************************************************/
    
    override var description: String { "Practice 3 - Section" }
    
//    let data = Array(1...100)
    var data = [5, 7, 16, 19, 22, 29, 30, 39, 44, 48, 50]
    var numberCategories: [Int: [Int]] = [:]
    var sectionTitles: [Int] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        settingArray()
        setupTableView()
    }
    
    private func setupTableView() {
        let tableView = UITableView(frame: view.frame)
        view.addSubview(tableView)
        
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CellID")
    }
    
    private func settingArray() {
        for digit in data {
            let share = digit / 10
            guard numberCategories[share] != nil else {
                numberCategories[share] = [digit]
                sectionTitles.append(share)
                continue
            }
            numberCategories[share]?.append(digit)
        }
    }
}


// MARK: - UITableViewDataSource
extension TableViewSection: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return numberCategories.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "\(sectionTitles[section])"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberCategories[sectionTitles[section]]!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellID", for: indexPath)
        cell.textLabel?.text = "\(numberCategories[sectionTitles[indexPath.section]]![indexPath.row])"
        return cell
    }
}
