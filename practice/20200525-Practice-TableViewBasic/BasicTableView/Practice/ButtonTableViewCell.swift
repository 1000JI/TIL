//
//  ButtonTableViewCell.swift
//  BasicTableView
//
//  Created by 천지운 on 2020/05/26.
//  Copyright © 2020 giftbot. All rights reserved.
//

import UIKit

class ButtonTableViewCell: UITableViewCell {

    let button = UIButton(type: .system)
    let label = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        button.setTitle("Count", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .systemFill
        contentView.addSubview(button)
        
        label.textColor = .black
        contentView.addSubview(label)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        button.frame = CGRect(x: frame.width - 100, y: 5, width: 80, height: 40)
        label.frame = CGRect(x: 10, y: 5, width: 80, height: 40)
    }
}
