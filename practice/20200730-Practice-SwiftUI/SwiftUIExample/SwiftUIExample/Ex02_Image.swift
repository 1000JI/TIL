//
//  Ex02_Image.swift
//  SwiftUIExample
//
//  Created by 천지운 on 2020/07/30.
//  Copyright © 2020 jwcheon. All rights reserved.
//

import SwiftUI

struct Ex02_Image: View {
    var body: some View {
        example04
    }
    
    var example04: some View {
        // some View라고 안써져있으면
        // HStack<TupleView<(Text, Image)>> 여기서 계속 바꿔줘야함
        // 따라서 some View로 통합해서 씀
        
        let myView = HStack { // 가로형태 Stack
            Text("Hello SwiftUI")
            Image("SwiftUI")
        }
        print(type(of: myView))
        // HStack<TupleView<(Text, Image)>>
        return myView
    }
    
    var example03: some View {
        HStack(spacing: 70) { // 가로형태 Stack
            Image(systemName: "book.fill")
                .imageScale(.small)
                .foregroundColor(.red)
            
            Image(systemName: "book.fill")
                .imageScale(.medium)
                .foregroundColor(.green)
            
            Image(systemName: "book.fill")
                .imageScale(.large)
                .foregroundColor(.blue)
        }
        .font(.largeTitle)
    }
    
    var example02: some View {
        HStack { // 가로형태 Stack
            Image("SwiftUI")
            
            Image("SwiftUI").renderingMode(.original)
            
            Image("SwiftUI").renderingMode(.template) // 원하는 색상으로 덮을 수 있음
            
            Image(systemName: "person").font(.largeTitle)
        }
        .foregroundColor(.red)
    }
    
    var example01: some View {
        HStack { // 가로형태 Stack
            Image("SwiftUI")
                .resizable()
                .frame(width: 100, height: 150)
            
            Image("SwiftUI")
                .resizable() // 프레임에 지정한 크기에 맞게 조정 됨
                .scaledToFit() // frame 크기에 맞게 비율대로 들어감(짤릴 수 있음)
                .frame(width: 100, height: 150)
            
            Image("SwiftUI")
                .resizable() // 프레임에 지정한 크기에 맞게 조정 됨
                .scaledToFill() // 사진 비율대로 화면을 꽉 채우는 것(삐져나갈 수 있음)
                .frame(width: 100, height: 150)
                .clipped() // 잘라내기
        }
    }
}

struct Ex02_Image_Previews: PreviewProvider {
    static var previews: some View {
        Ex02_Image()
    }
}
