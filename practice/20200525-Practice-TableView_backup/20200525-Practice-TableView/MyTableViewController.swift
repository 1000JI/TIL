//
//  MyTableViewController.swift
//  20200525-Practice-TableView
//
//  Created by 천지운 on 2020/05/25.
//  Copyright © 2020 jwcheon. All rights reserved.
//

import UIKit

// 다른 Class에서도 사용 할 수 있도록 전역 변수로 선언하였다.
var items = ["책 구매", "철수와 약속", "스터디 준비하기"]
var itemsImageFile = ["cart.png", "clock.png", "pencil.png"]

class MyTableViewController: UITableViewController {

    @IBOutlet var tvListView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Bar Button으로 목록 삭제하는 기능을 왼쪽에 추가
        self.navigationItem.leftBarButtonItem = self.editButtonItem
    }
    
    override func viewWillAppear(_ animated: Bool) {
        /*0
         뷰가 최초 호출되는 순서
         ViewDidLoad -> ViewWillAppear -> ViewDidAppear

         뷰가 전환될 때 호출되는 순서
         ViewWillAppear -> ViewDidAppear

         ViewDidLoad : 뷰가 로드되었을 때 호출되는 함수로 뷰가 생성될 때 한 번만 호출한다.
         ViewWillAppear : 뷰가 노출될 준비가 끝났을 때 호출되는 함수로 뷰가 노출될 때마다 호출됩니다.
         ViewDidAppear : 뷰가 완전히 보인 후 호출되는 함수로 뷰가 완전히 보인 후 호출됩니다.
         */
        tvListView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        if segue.identifier == "sgDetail" {
            let cell = sender as! UITableViewCell
            let indexPath = self.tvListView.indexPath(for: cell)
            let detailView = segue.destination as! DetailViewController
            detailView.receiveitem(items[((indexPath! as NSIndexPath).row)])
        }
    }
}

// MARK: - Table view data source
extension MyTableViewController {
    // 테이블 안의 섹션 갯수를 설정하며, 보통 1개로 사용하나 상황에 따라 다르다.
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    // 각 section당 row의 갯수를 정해줄 수 있다.
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    // 각 셀을 구성할 수 있는 함수
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        
        // (indexPath as NSIndexPath).row
        cell.textLabel?.text = items[indexPath.row]
        cell.imageView?.image = UIImage(named: itemsImageFile[indexPath.row])
        
        return cell
    }
    
    // 목록 삭제 기능 추가하기
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            items.remove(at: (indexPath as NSIndexPath).row)
            itemsImageFile.remove(at: (indexPath as NSIndexPath).row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    
    // Delete를 한글로 수정하기
    override func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "삭제"
    }
    
    // 리스트 순서 바꾸기 기능 추가
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let itemToMove = items[(sourceIndexPath as NSIndexPath).row] // 이동할 아이템 텍스트를 변수에 저장
        let itemImageToMove = itemsImageFile[(sourceIndexPath as NSIndexPath).row] // 이동할 아이템 이미지를 변수에 저장
        items.remove(at: (sourceIndexPath as NSIndexPath).row) // 이동할 텍스트를 기존위치에서 삭제
        itemsImageFile.remove(at: (sourceIndexPath as NSIndexPath).row) // 이동할 이미지를 기존 위치에서 삭제
        items.insert(itemToMove, at: (destinationIndexPath as NSIndexPath).row) // 변수에 담긴 텍스트를 새로운 위치에 삽입
        itemsImageFile.insert(itemImageToMove, at: (destinationIndexPath as NSIndexPath).row) // 변수에 담긴 이미지를 새로운 텍스트에 삽입
    }
}
