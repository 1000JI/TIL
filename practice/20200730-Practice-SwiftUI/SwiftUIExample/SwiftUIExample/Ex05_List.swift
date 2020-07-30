//
//  Ex05_List.swift
//  SwiftUIExample
//
//  Created by 천지운 on 2020/07/30.
//  Copyright © 2020 jwcheon. All rights reserved.
//

import SwiftUI

struct Ex05_List: View {
    var body: some View {
        example04
    }
    
    var example04: some View {
        List {
            Section(header: Text("헤더1"),
                    footer: Text("푸터1")) {
                        Text("1")
                        Text("2")
                        Text("3")
                        Text("SwiftUI")
            }
            
            Section(header: Text("헤더2"),
                    footer: HStack { Spacer(); Text("푸터2") } ) {
                        Text("섹션2")
                        Text("SwiftUI")
            }
        }
        .listStyle(GroupedListStyle())
    }
    
    var example03: some View {
        List(0..<100) {
            Text("\($0)")
        }
    }
    
    var example02: some View {
        List { // 자식 뷰는 최대 10개까지
            Text("List").font(.largeTitle)
            Image("SwiftUI")
            Circle().frame(width: 100, height: 100)
            Color(.red).frame(width: 100, height: 100)
        }
    }
    
    var example01: some View {
        List { // 자식 뷰는 최대 10개까지
            Text("1")
            Text("2")
        }
    }
}

struct Ex05_List_Previews: PreviewProvider {
    static var previews: some View {
        Ex05_List()
    }
}
