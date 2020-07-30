//
//  Ex03_ViewLayout.swift
//  SwiftUIExample
//
//  Created by 천지운 on 2020/07/30.
//  Copyright © 2020 jwcheon. All rights reserved.
//

import SwiftUI

struct Ex03_ViewLayout: View {
    var body: some View {
        example04
    }
    
    /*
     HStack -> 가로 Stack
     VStack -> 세로 Stack
     ZStack -> 겹쳐짐
     */
    var example04: some View {
        VStack {
            Text("제목").font(.largeTitle)
            Text("부제목").foregroundColor(Color.gray)
            Spacer() // 1/3
            Text("본문 내용")
            Spacer() // 2/3
            Spacer()
            Text("각주").font(.body)
        }
            .font(.title) // 부제목과 본몬 내용에게만 적용됨(미리 적용한 것이 우선 순위가 높음)
            .frame(width: 200, height: 350)
            .padding()
            .border(Color.red, width: 2)
    }
    
    var example03: some View {
        HStack {
            Spacer()
//                .frame(width: 200)
            Text("Spacer")
                .font(.title)
                .padding()
                .background(Color.yellow)
        }
        .background(Color.blue)
    }
    
    var example02: some View {
        VStack(spacing: 50) {
            HStack(spacing: 10) {
                Rectangle()
                    .fill(Color.green)
                    .frame(width: 150, height: 150)
                
                Rectangle()
                    .fill(Color.yellow)
                    .frame(width: 150, height: 150)
            }
            
            HStack(spacing: 10) {
                Rectangle()
                    .fill(Color.green)
                    .frame(width: 150, height: 150)
                
                Rectangle()
                    .fill(Color.yellow)
                    .frame(width: 150, height: 150)
            }
        }
    }

    var example01: some View {
        ZStack {
            Rectangle()
                .fill(Color.green)
                .frame(width: 150, height: 150)
            
            Rectangle()
                .fill(Color.yellow)
                .frame(width: 150, height: 150)
                .offset(x: 40, y: 40)
        }
    }
}

struct Ex03_ViewLayout_Previews: PreviewProvider {
    static var previews: some View {
        Ex03_ViewLayout()
    }
}
