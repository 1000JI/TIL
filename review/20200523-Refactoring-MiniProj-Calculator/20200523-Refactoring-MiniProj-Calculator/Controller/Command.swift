//
//  Command.swift
//  20200523-Refactoring-MiniProj-Calculator
//
//  Created by 천지운 on 2020/05/23.
//  Copyright © 2020 jwcheon. All rights reserved.
//

import Foundation

enum Command {
    case addDigit(String)
    case operation(String)
    case equal
    case clear
}
