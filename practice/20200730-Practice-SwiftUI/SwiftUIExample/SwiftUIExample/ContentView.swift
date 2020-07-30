//
//  ContentView.swift
//  SwiftUIExample
//
//  Created by 천지운 on 2020/07/30.
//  Copyright © 2020 jwcheon. All rights reserved.
//

import SwiftUI
// Objective-C => UIKit // class
// Swift => SwiftUI // struct

struct ContentView: View {
    var body: some View {
        Ex01_Text()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark) // DarkMode
    }
}
