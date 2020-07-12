//
//  CafeService.swift
//  CafeSpot
//
//  Created by 천지운 on 2020/07/12.
//  Copyright © 2020 Giftbot. All rights reserved.
//

import Foundation

struct CafeService {
    static let shared = CafeService()
    private init() { }
    
    func fetchCafeData(completion: @escaping([Cafe]) -> Void) {
        let decoder = JSONDecoder()
        var cafeList = [Cafe]()
        
        let path = Bundle.main.path(forResource: "CafeList", ofType: "json")
        let fileUrl = URL(fileURLWithPath: path!)
        
        if let data = try? Data(contentsOf: fileUrl) {
            if let jsonObjects = try? decoder.decode([Cafe].self, from: data) {
                for cafe in jsonObjects {
                    cafeList.append(cafe)
                    completion(cafeList)
                }
            }
        }
    }
}
