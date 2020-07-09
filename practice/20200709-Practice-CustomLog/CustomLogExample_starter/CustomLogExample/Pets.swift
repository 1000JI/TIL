//
//  Pets.swift
//  CustomLogExample
//
//  Copyright © 2020 giftbot. All rights reserved.
//

import Foundation

class Dog: CustomStringConvertible, CustomDebugStringConvertible {
    let name = "Tory"
    let age = 5
    let feature: [String: String] = [
        "breed": "Poodle",
        "tail": "short"
    ]
    
    var description: String {
        "Dog's name: \(name), age \(age)"
    }
    
    var debugDescription: String {
        "Dog's name: \(name), age: \(age), feature: \(feature)"
    }
}

struct Cat: CustomStringConvertible, CustomDebugStringConvertible {
    let name = "Lilly"
    let age = 2
    let feature: [String: String] = [
        "breed": "Koshort",
        "tail": "short"
    ]
    
    var description: String {
        "Cat's name: \(name), age \(age)"
    }
    
    var debugDescription: String {
        "Cat's name: \(name), age: \(age), feature: \(feature)"
    }
}
