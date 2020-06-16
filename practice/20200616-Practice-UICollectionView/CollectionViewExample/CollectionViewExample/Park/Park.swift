//
//  NationalPark.swift
//  CollectionViewExample
//
//  Copyright © 2020 giftbot. All rights reserved.
//

import Foundation

struct Park {
  enum Location: String, CaseIterable {
    case alaska = "Alaska"
    case arizona = "Arizona"
    case california = "California"
    case colorado = "Colorado"
    case maine = "Maine"
    case montana = "Montana"
    case northCarolina = "North Carolina"
    case ohio = "Ohio"
    case utah = "Utah"
    case virginia = "Virginia"
    case washington = "Washington"
  }
  
  let location: Location
  let name: String
}
