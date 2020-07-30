//
//  Ex01_Text.swift
//  SwiftUIExample
//
//  Created by 천지운 on 2020/07/30.
//  Copyright © 2020 jwcheon. All rights reserved.
//

import SwiftUI

struct Ex01_Text: View {
    var body: some View {
        example05
    }
    
    // modifier - method
    // 수식어 - 뷰에서 사용가능한 메서드, 어떤 변화를 가미한 새로운 뷰를 반환하는 메서드
    var example01: some View {
        Text("Hello SwiftUI")
            .font(.custom("AppleGothic", size: 40))
        
    }
    
    var example02: some View {
        Text("Hello ").font(.title)
            .foregroundColor(.green)
            .italic()
            +
            Text("SwiftUI").font(.largeTitle)
                .foregroundColor(.blue)
                .baselineOffset(8)
    }
    
    var example03: some View {
        Text("Hello SwiftUI")
            .font(.title)
            .kerning(5) // 자간 간격
            .underline(false, color: .green)
            .strikethrough(true, color: .blue)
    }
    
    var example04: some View {
        Text("Hello SwiftUI")
            .font(.largeTitle) // Return Text
            .bold() // Return Text
            .background(Color.yellow) // Return View
        
//        Text("Hello SwiftUI")
//            .background(Color.yellow)
//            .font(.largeTitle)
////            .bold() // error => Text만 가진 수식어
        // 순서 조심ㅎㅎㅎㅎ
    }
    
    var example05: some View {
        VStack(spacing: 20) {
            Text("👩🤕🥦").font(.largeTitle)
                .padding()
                .background(Color.yellow) // 늘어난 후 배경 색상
            
            
            Text("👩🤕🥦").font(.largeTitle)
                .background(Color.yellow) // 늘어나기 전 배경 색상
                .padding()
        }
    }
}

struct Ex01_Text_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Ex01_Text()
//                .previewLayout(.sizeThatFits) // 뷰의 크기 만큼 줄어듦
//                .previewLayout(.fixed(width: 300, height: 200))
                .previewLayout(.device)
            
            Ex01_Text()
                .preferredColorScheme(.dark)
                .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
            
            Ex01_Text()
                .preferredColorScheme(.light)
                .previewDevice(PreviewDevice(rawValue: "iPhone 8"))
        }
    .previewDisplayName("Sweet SwiftUI")
    }
}
