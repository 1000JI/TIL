//
//  WishListViewController.swift
//  Dominos11_Starter
//
//  Created by Lee on 2020/05/26.
//  Copyright © 2020 Kira. All rights reserved.
//

import UIKit

class WishListViewController: UIViewController {
    
    let wishTableView = UITableView()
    var menuTitles: [String] = SaveProduct.orderMenu.keys.sorted()
    var totalPrice: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupTableView()
    }
    
    private func setupTableView() {
        view.addSubview(wishTableView)
        wishTableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            wishTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            wishTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0),
            wishTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            wishTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0)
        ])
        
        wishTableView.rowHeight = 100
        wishTableView.dataSource = self
    }
    
    private func setupView() {
        title = "Wish List"
        
        let clearListButton = UIBarButtonItem(title: "목록 지우기", style: .done, target: self, action: #selector(clickedClearListEvent(_:)))
        self.navigationItem.leftBarButtonItem = clearListButton
        
        let orderButton = UIBarButtonItem(title: "주문", style: .done, target: self, action: #selector(clickedOrderEvent(_:)))
        self.navigationItem.rightBarButtonItem = orderButton
    }
    
    @objc private func clickedClearListEvent(_ sender: Any) {
        clearWishList()
    }
    
    @objc private func clickedOrderEvent(_ sender: Any) {
        var orderString: String = ""
        totalPrice = 0
        
        for title in menuTitles {
            let menuCount = SaveProduct.orderMenu[title]!["개수"] as! Int
            let temp = "\(title) - \(menuCount)개\n"
            totalPrice += SaveProduct.orderMenu[title]!["가격"] as! Int
            orderString.append(temp)
        }
        let priceString = "결제금액 : \(totalPrice)"
        orderString.append(priceString)
        
        
        let orderAlert = UIAlertController(title: "결제내역", message: orderString, preferredStyle: .alert)
        
        let returnAction = UIAlertAction(title: "돌아가기", style: .cancel, handler: nil)
        let paymentAction = UIAlertAction(title: "결제하기", style: .default) { (_) in
            self.clearWishList()
        }
        
        orderAlert.addAction(returnAction)
        orderAlert.addAction(paymentAction)
        
        self.present(orderAlert, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        menuTitles = SaveProduct.orderMenu.keys.sorted()
        wishTableView.reloadData()
    }
    
    private func clearWishList() {
        SaveProduct.orderMenu.removeAll()
        menuTitles = SaveProduct.orderMenu.keys.sorted()
        wishTableView.reloadData()
    }
}

extension WishListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuTitles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Subtitle")
        ?? UITableViewCell(style: .subtitle, reuseIdentifier: "Subtitle")
        
        cell.textLabel?.text = menuTitles[indexPath.row]
        
        let picName = SaveProduct.orderMenu[menuTitles[indexPath.row]]!["사진"] as! String
        cell.imageView?.image = UIImage(named: picName)

        let menuCount = SaveProduct.orderMenu[menuTitles[indexPath.row]]!["개수"] as! Int
        cell.detailTextLabel?.text = "주문수량 : \(menuCount)"
        
        return cell
    }
}
