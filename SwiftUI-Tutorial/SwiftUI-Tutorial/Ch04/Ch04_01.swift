//
//  Ch04_01.swift
//  SwiftUI-Tutorial
//
//  Created by NHN on 2021/05/18.
//

import SwiftUI

struct Ch04_01: View {
    var body: some View {
        Example01()
    }
}

private extension Ch04_01 {
    struct Example01: View {
        var body: some View {
            VStack {
                // 텍스트를 이용한 버튼
                HStack(spacing: 20) {
                    Button("텍스트 버튼1") {
                        print("Button1")
                    }
                    Button(action: { print("Button2") }) {
                        Text("텍스트 버튼2")
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 10).strokeBorder())
                    }
                }
                // 이미지를 이용한 버튼
                HStack {
                    Button(action: { print("Button3") }) {
                        Image("SwiftUI")
                            .resizable()
                            .frame(width: 120, height: 120)
                    }
                    Button(action: { print("Button4") }) {
                        Image(systemName: "play.circle")
                            .imageScale(.large)
                            .font(.largeTitle)
                    }
                }
            }
        }
    }
    
    struct Example02: View {
        var body: some View {
            VStack(spacing: 30) {
                Button("DefaultButtonStyle") {}
                    .buttonStyle(DefaultButtonStyle())
                Button("BorderlessButtonStyle") {}
                    .buttonStyle(BorderlessButtonStyle())
                Button("PlainButtonStyle") {}
                    .buttonStyle(PlainButtonStyle())
            }
        }
    }
    
    struct Example03: View {
        var body: some View {
            HStack {
                // 아래 2개의 뷰는 동일한 동작을 함
                Image(systemName: "person.circle").imageScale(.large)
                    .onTapGesture {
                        print("onTapGesture")
                    }
                Button(action: { print("Button") }) {
                    Image(systemName: "person.circle").imageScale(.large)
                }
            }
        }
    }
}

struct Ch04_01_Previews: PreviewProvider {
    static var previews: some View {
        Ch04_01()
    }
}
