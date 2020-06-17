//
//  CatModel.swift
//  CollectionViewPractice
//
//  Created by 천지운 on 2020/06/16.
//  Copyright © 2020 Giftbot. All rights reserved.
//

import Foundation

struct Service {
    
    static func fetchCats(completion: @escaping([String]) -> Void) {
        let basicCatsList = [
            "cat0", "cat1", "cat2", "cat3", "cat4",
            "cat5", "cat6", "cat7", "cat8", "cat9",
            "cat0", "cat1", "cat2", "cat3", "cat4",
            "cat5", "cat6", "cat7", "cat8", "cat9"
        ]
        
        completion(basicCatsList)
    }
}
