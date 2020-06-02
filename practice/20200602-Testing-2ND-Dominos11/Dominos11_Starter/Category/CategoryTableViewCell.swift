//
//  CategoryTableViewCell.swift
//  Dominos11_Starter
//
//  Created by 천지운 on 2020/05/29.
//  Copyright © 2020 Kira. All rights reserved.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {

    let backgroundButton = UIButton(type: .system)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(backgroundButton)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        backgroundButton.setTitle("", for: .normal)
        backgroundButton.frame = contentView.frame
    }
}
