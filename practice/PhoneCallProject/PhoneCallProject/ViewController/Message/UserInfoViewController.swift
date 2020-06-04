//
//  UserInfoViewController.swift
//  PhoneCallProject
//
//  Created by 이진욱 on 2020/06/03.
//  Copyright © 2020 jwcheon. All rights reserved.
//

import UIKit

class UserInfoViewController: UIViewController {
    
    var gropuLabel = UILabel()
    var nameLabel = UILabel()
    var numberuLabel = UILabel()
    
    var CGcount: CGFloat = 0
    var count = 1
    var padding: CGFloat = 20
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        createListView()
    }
    func setupView() {
        view.backgroundColor = .systemBackground
        title = "그룹 리스트"
    }
    func createListView() {
        for index in 0...MessageData.group.count - 3 {
            let index = UIView()
            index.frame = CGRect (x: view.safeAreaInsets.left + 20, y: (view.safeAreaInsets.top + 100) + (100 * CGcount), width: view.frame.width - (padding * 2), height: 100)
            index.backgroundColor = .systemIndigo
            index.layer.cornerRadius = 15
            index.clipsToBounds = true
            
            gropuLabel.text = "그룹명 : " + MessageData.group[count]
            print ("gropuLabel.text : ", gropuLabel.text)
            gropuLabel.textColor = .black
            gropuLabel.frame = CGRect (x: index.safeAreaInsets.left, y: 0, width: 100, height: 30)
            
            nameLabel.text = "이름 : " + "\(MessageData.messageUserList.keys.sorted())"
            print ("MessageData.messageUserList.keys.sorted() : ",  MessageData.messageUserList.keys.sorted())
            nameLabel.textColor = .black
            nameLabel.frame = CGRect (x: index.safeAreaInsets.left, y: 40, width: index.frame.width, height: 30)
            
            
            numberuLabel.text = "전화번호 : " + "\(MessageData.messageUserList.values)"
            print ("MessageData.messageUserList.values : ", MessageData.messageUserList.values)
            numberuLabel.textColor = .black
            numberuLabel.frame = CGRect (x: index.safeAreaInsets.left, y: 70, width: index.frame.width, height: 30)
            
            CGcount += 1
            count += 1
            view.addSubview(index)
            index.addSubview(gropuLabel)
            index.addSubview(nameLabel)
            index.addSubview(numberuLabel)
        }
    }
}
