//
//  ViewController.swift
//  ShoppingItems
//
//  Created by giftbot on 2020. 05. 26..
//  Copyright © 2020년 giftbot. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    
    var tupleArrayProduct = [
        ("iPhone8",             "iPhone8",                  0),
        ("iPhone8",             "iPhone8+",                 0),
        ("iPhone8",             "iPhone8 - (2)",            0),
        ("iPhoneX_SpaceGray",   "iPhoneX_SpaceGray",        0),
        ("iPhoneX_SpaceGray",   "iPhoneX_SpaceGray+",       0),
        ("iPhoneX_SpaceGray",   "iPhoneX_SpaceGray - (2)",  0),
        ("iPhoneX_White",       "iPhoneX_White",            0),
        ("iPhoneX_White",       "iPhoneX_White+",           0),
        ("iPhoneX_White",       "iPhoneX_White - (2)",      0),
        ("iPhoneSE_Gold",       "iPhoneSE_Gold",            0),
        ("iPhoneSE_Gold",       "iPhoneSE_Gold+",           0),
        ("iPhoneSE_Gold",       "iPhoneSE_Gold - (2)",      0),
        ("iPhoneSE_RoseGold",   "iPhoneSE_RoseGold",        0),
        ("iPhoneSE_RoseGold",   "iPhoneSE_RoseGold+",       0),
        ("iPhoneSE_RoseGold",   "iPhoneSE_RoseGold - (2)",  0),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
    }
    
    private func setupTableView() {
        tableView.rowHeight = 80
    }
}

// MARK: - UITableViewDataSource
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tupleArrayProduct.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as! ItemCell
        
        cell.imageView?.image = UIImage(named: "\(tupleArrayProduct[indexPath.row].0)")
        
        if cell.textLabel?.text == nil {
            cell.countButton.addTarget(self, action: #selector(clickedButtonEvent(_:)), for: .touchUpInside)
            cell.countButton.tag = indexPath.row
        }
        
        cell.textLabel?.text = "\(tupleArrayProduct[indexPath.row].1)"
        cell.countLabel.text = "\(tupleArrayProduct[indexPath.row].2)"
        
        return cell
    }
    
    @objc private func clickedButtonEvent(_ sender: UIButton) {
        guard (tupleArrayProduct[sender.tag].2 + 1) <= 5 else {
            
            let alert = UIAlertController(title: "경고", message: "초과 구매는 불가능합니다.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "확인", style: .default, handler: nil))
            self.present(alert, animated: true)
            
            let indexPath = IndexPath(row: sender.tag, section: 0)
            let cell = self.tableView.cellForRow(at: indexPath)
            
            UIView.animate(withDuration: 0.5, animations: {
                cell?.backgroundColor = .systemRed
            }) { (_) in
                UIView.animate(withDuration: 0.5) {
                    cell?.backgroundColor = .white
                }
            }
            return
        }
        tupleArrayProduct[sender.tag].2 += 1
        tableView.reloadData()
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//        let customCell = cell as! ItemCell
//        customCell.countButton.addTarget(self, action: #selector(clickedButtonEvent(_:)), for: .touchUpInside)
//        customCell.countButton.tag = indexPath.row
    }
}

