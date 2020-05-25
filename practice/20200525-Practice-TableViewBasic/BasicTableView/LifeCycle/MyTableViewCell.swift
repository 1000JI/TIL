//
//  TableViewCell.swift
//  BasicTableView
//
//  Created by Giftbot on 2020/05/25.
//  Copyright © 2020 giftbot. All rights reserved.
//

import UIKit

class MyTableViewCell: UITableViewCell {
    
    // 코드로 생성 시
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        print("---------- [ init(style:reuserIdentifier) ] ----------")
    }
    
    // 스토리보드로 생성 시
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // 재사용
    override func prepareForReuse() {
        super.prepareForReuse()
        print("---------- [ prepareForReuse ] ----------")
    }
    
    // 메모리 해제
    deinit {
        print("Deinit")
    }
}
