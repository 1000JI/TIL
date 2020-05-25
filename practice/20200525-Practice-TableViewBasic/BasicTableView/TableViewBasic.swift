//
//  TableViewBasic.swift
//  BasicTableView
//
//  Created by Giftbot on 2020/05/25.
//  Copyright © 2020 giftbot. All rights reserved.
//

import UIKit

final class TableViewBasic: UIViewController {
  
  override var description: String { "TableView - Basic" }
  lazy var tableView = UITableView(frame: view.frame)
  
  override func viewDidLoad() {
    super.viewDidLoad()
    title = "Basic"
    
    view.addSubview(tableView)
    
    // 데이터 소스 연결
    tableView.dataSource = self
    
    /***************************************************
    재사용할 셀의 클래스를 미리 등록 가능
    새로운 아이디 -> 새로 등록
    같은 아이디 -> 이전에 등록한 클래스 업데이트
    ***************************************************/
    
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CellID")
    
//    tableView.register(MyTableViewCell.self, forCellReuseIdentifier: "CellID")
    
//    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "NoCellID")
  }
}


// MARK: - UITableViewDataSource

extension TableViewBasic: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 100
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    // 1번 - 기본 셀 생성
//    let cell = UITableViewCell(style: .default, reuseIdentifier: "CellID")
//    cell.textLabel?.text = "\(indexPath.row)"
//    return cell
    
    /*
    2) 1번의 문제점 - 만약 셀 개수가 1만개 또는 10만개면? -> 셀의 재사용 필요
    tableView.dequeueReusableCell(withIdentifier: "CellID")
    리턴 타입 -> Optional. 즉, 최초에는 일단 만들어 주어야 함.
    */
//    let cell: UITableViewCell
//    if let reusableCell = tableView.dequeueReusableCell(withIdentifier: "CellID") {
//      cell = reusableCell
//    } else {
//      cell = UITableViewCell(style: .default, reuseIdentifier: "CellID")
//    }
//    cell.textLabel?.text = "\(indexPath.row)"
//    return cell
    
    /*
     3) 미리 셀 등록
     */
    let cell = tableView.dequeueReusableCell(withIdentifier: "CellID", for: indexPath)
    cell.textLabel?.text = "\(indexPath.row)"
    return cell
  }
}



