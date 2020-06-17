//
//  CatModel.swift
//  CollectionViewPractice
//
//  Created by 천지운 on 2020/06/16.
//  Copyright © 2020 Giftbot. All rights reserved.
//

import Foundation

class CatsList {
    
    private init() { }
    static let shared = CatsList()
    
    private let basicCatsList = [
        "cat0", "cat1", "cat2", "cat3", "cat4",
        "cat5", "cat6", "cat7", "cat8", "cat9",
        "cat0", "cat1", "cat2", "cat3", "cat4",
        "cat5", "cat6", "cat7", "cat8", "cat9"
    ]
    
    lazy var changeCatsList = basicCatsList
    
    func resetList() {
        changeCatsList = basicCatsList
    }
    
    func removeIndex(index: Int) {
        changeCatsList.remove(at: index)
    }
}


struct Service {
//    static func fetchCate(completion: @escaping([]))
}
