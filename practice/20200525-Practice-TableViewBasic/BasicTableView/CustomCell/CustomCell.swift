//
//  CustomCell.swift
//  BasicTableView
//
//  Created by Giftbot on 2020/05/25.
//  Copyright © 2020 giftbot. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {
    
    let myLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        // 커스텀 뷰를 올릴 때는 contentView 위에 추가
        myLabel.textColor = .black
        myLabel.backgroundColor = .systemYellow
        contentView.addSubview(myLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // 레이아웃 조정 시
    override func layoutSubviews() {
        super.layoutSubviews()
        
//        self.myLabel.frame = CGRect(
//            x: frame.width - 120, y: 15,
//            width: 100, height: frame.height - 30
//        )
    }
}
