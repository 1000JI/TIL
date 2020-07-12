//
//  Cafe.swift
//  CafeSpot
//
//  Created by 천지운 on 2020/07/10.
//  Copyright © 2020 Giftbot. All rights reserved.
//

import Foundation

struct Cafe {
    let title: String
    let description: String
    let location: Location
    var isFavorite: Bool
    
    enum CodingKeys: String, CodingKey {
        case title
        case description
        case location
        case isFavorite
    }
}


struct Location {
    let address: String
    let lat: Double
    let lng: Double
    
    enum CodingKeys: String, CodingKey {
        case address
        case lat
        case lng
    }
}


extension Cafe: Decodable {
    init(from decoder: Decoder) throws {
        let keyedContainer = try decoder.container(keyedBy: CodingKeys.self)
        title = try keyedContainer.decode(String.self, forKey: .title)
        description = try keyedContainer.decode(String.self, forKey: .description)
        isFavorite = try keyedContainer.decode(Bool.self, forKey: .isFavorite)
        location = try keyedContainer.decode(Location.self, forKey: .location)
    }
}

extension Location: Decodable {
    init(from decoder: Decoder) throws {
        let keyedContainer = try decoder.container(keyedBy: CodingKeys.self)
        address = try keyedContainer.decode(String.self, forKey: .address)
        lat = try keyedContainer.decode(Double.self, forKey: .lat)
        lng = try keyedContainer.decode(Double.self, forKey: .lng)
    }
}
