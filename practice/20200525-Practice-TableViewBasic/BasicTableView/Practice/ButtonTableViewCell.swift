//
//  ButtonTableViewCell.swift
//  BasicTableView
//
//  Created by 천지운 on 2020/05/26.
//  Copyright © 2020 giftbot. All rights reserved.
//

import UIKit

//protocol
protocol CustomCellDelegate: class {
    func customCell(_ cell: ButtonTableViewCell, selectedRow row: Int)
}

class ButtonTableViewCell: UITableViewCell {

    let button = UIButton(type: .system)
    let label = UILabel()
    
    // delegate 사용 방법
    var delegate: CustomCellDelegate?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        button.setTitle("MyButton", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .systemGreen
        contentView.addSubview(button)
        
        label.textColor = .black
        contentView.addSubview(label)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews() // 이거 안해주니까 tableViewCell에 테두리가 안생김
        
        button.frame = CGRect(x: frame.width - 100, y: 5, width: 80, height: 40)
        label.frame = CGRect(x: 10, y: 5, width: 80, height: 40)
    }
}

