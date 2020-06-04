//
//  ViewController.swift
//  PhoneCallProject
//
//  Created by 천지운 on 2020/06/03.
//  Copyright © 2020 jwcheon. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        phoneCallTableView.reloadData()
        messageTableView.reloadData()
    }
    
    // MARK: TableViews
    private lazy var phoneCallTableView: UITableView = {
        let tableView = UITableView()
        tableView.layer.cornerRadius = 20
        tableView.backgroundColor = .systemYellow
        tableView.alpha = 1
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
    private lazy var messageTableView: UITableView = {
        let tableView = UITableView()
        tableView.layer.cornerRadius = 20
        tableView.backgroundColor = .systemGreen
        tableView.alpha = 1
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
    
    // MARK: Buttons
    private lazy var phoneCallButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Start Call", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        button.titleLabel?.font = .boldSystemFont(ofSize: 20)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.darkGray.cgColor
        button.layer.cornerRadius = 20
        button.addTarget(self, action: #selector(clickedPhoneCallEvent), for: .touchUpInside)
        return button
    }()

    @objc func clickedPhoneCallEvent(_ sender: UIButton) {
        let callerVC = PhoneCallStyleViewController()
        callerVC.view.backgroundColor = .systemBackground
        callerVC.title = "스타일 선택"
        
        let naviVC = UINavigationController(rootViewController: callerVC)
        naviVC.modalPresentationStyle = .automatic
        
        present(naviVC, animated: true)
    }
    
    private lazy var messageButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Start Message", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        button.titleLabel?.font = .boldSystemFont(ofSize: 20)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.darkGray.cgColor
        button.layer.cornerRadius = 20
        button.addTarget(self, action: #selector(clickedMessageEvent), for: .touchUpInside)
        return button
    }()

    @objc func clickedMessageEvent(_ sender: UIButton) {
        
    }
    
    // MARK: - Setup Layout
    private func setupLayout() {
        let layoutViews = [phoneCallTableView, phoneCallButton, messageTableView, messageButton]
        
        for item in layoutViews {
            view.addSubview(item)
            item.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            phoneCallTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            phoneCallTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            phoneCallTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16)
        ])
        
        NSLayoutConstraint.activate([
            messageTableView.topAnchor.constraint(equalTo: phoneCallTableView.bottomAnchor, constant: 16),
            messageTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            messageTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            messageTableView.heightAnchor.constraint(equalTo: phoneCallTableView.heightAnchor, multiplier: 1.0)
        ])
        
        NSLayoutConstraint.activate([
            phoneCallButton.topAnchor.constraint(equalTo: messageTableView.bottomAnchor, constant: 16),
            phoneCallButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            phoneCallButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16),
            phoneCallButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            messageButton.topAnchor.constraint(equalTo: messageTableView.bottomAnchor, constant: 16),
            messageButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16),
            messageButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            messageButton.leadingAnchor.constraint(equalTo: phoneCallButton.trailingAnchor, constant: 16),
            messageButton.widthAnchor.constraint(equalTo: phoneCallButton.widthAnchor),
            messageButton.heightAnchor.constraint(equalTo: phoneCallButton.heightAnchor)
        ])
    }
}

// MARK: - TableView DataSource, Delegate
extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    // MARK: 테이블 뷰 헤더 네임
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if tableView == phoneCallTableView { return "전화" }
        else { return "메세지" }
    }
    
    // MARK: 테이블 뷰 셀 갯수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == phoneCallTableView { return AppShared.phoneCallTitles.count }
        else { return 0 }
    }
    
    // MARK: 테이블 뷰 Cell Setting
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == phoneCallTableView {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Value1")
            ?? UITableViewCell(style: .value1, reuseIdentifier: "Value1")
            
            cell.imageView?.image = UIImage(systemName: "\(AppShared.phoneCallTitles[indexPath.row].1)")
            cell.imageView?.tintColor = .black
            cell.textLabel?.text = "\(AppShared.phoneCallTitles[indexPath.row].0)"
            cell.accessoryType = .disclosureIndicator
            cell.detailTextLabel?.text = "\(AppShared.phoneCallMenu[AppShared.phoneCallTitles[indexPath.row].0] ?? "")"
            
            cell.backgroundColor = .systemYellow
            return cell
        } else {
            
        }
        return UITableViewCell()
    }
    
    // MARK: Cell Selected
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == phoneCallTableView {
            
            if indexPath.row == 0 {
                let cell = tableView.cellForRow(at: indexPath)
                if let text = cell?.detailTextLabel?.text {
                    let timeVC = TimeViewController()
                    timeVC.selectTime = text
                    timeVC.title = cell?.textLabel?.text!
                    
                    navigationController?.pushViewController(timeVC, animated: true)
                }
            } else {
                let callerVC = CallerViewController()
                callerVC.title = "발신자"
                
                navigationController?.pushViewController(callerVC, animated: true)
            }
        }
    }
}

