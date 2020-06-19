//
//  InputModel.swift
//  SlackNewWorkspaceUI
//
//  Created by 천지운 on 2020/06/19.
//  Copyright © 2020 giftbot. All rights reserved.
//

import Foundation

enum InputType {
    case nameType
    case urlType
}

struct InputModel {
    var noticeText: String
    var errorText: String
    var inputText: String
    var placeHolderText: String
    var inputType: InputType
}
