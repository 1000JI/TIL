//
//  Ex04_Button.swift
//  SwiftUIExample
//
//  Created by 천지운 on 2020/07/30.
//  Copyright © 2020 jwcheon. All rights reserved.
//

import SwiftUI

struct Ex04_Button: View {
    var body: some View {
        example02
    }
    
    var example02: some View {
        HStack(spacing: 20) {
            Button(action: { print("Button 1") }) {
                Image("SwiftUI")
                    .resizable()
                    .frame(width: 120, height: 120)
            }
            
            Button(action: { print("Button 2") }) {
                Image(systemName: "play.circle")
//                    .renderingMode(.original) // 색상이 안바뀜
                    .imageScale(.large)
                    .font(.largeTitle)
            }
            .accentColor(.green)
        }
    }
    
    var example01: some View {
        HStack(spacing: 20) {
            Button("Button") {
                print("Button 1")
            }
            
            Button(action: { print("Button 2") }) {
                Text("Button")
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10).strokeBorder())
            }
            
            Button(action: { print("Button 3") }) {
                Circle()
                    .stroke(lineWidth: 2)
                    .frame(width: 80, height: 80)
                    .overlay(Text("Button"))
            }
            .accentColor(.green)
        }
    }
}

struct Ex04_Button_Previews: PreviewProvider {
    static var previews: some View {
        Ex04_Button()
    }
}
