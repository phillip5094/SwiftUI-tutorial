//
//  Ch04_02.swift
//  SwiftUI-Tutorial
//
//  Created by NHN on 2021/05/18.
//

import SwiftUI

struct Ch04_02: View {
    var body: some View {
        Example01()
    }
}

private extension Ch04_02 {
    struct Example01: View {
        var body: some View {
            // 잘못된 방법
//            NavigationView {
//                Image("SwiftUI")
//            }.navigationBarTitle("내비게이션 바 타이틀")
            
            NavigationView {
                Image("SwiftUI")
                    .navigationBarTitle("내비게이션 바 타이틀")
            }
        }
    }
    
    struct Example02: View {
        var body: some View {
            NavigationView {
                Image("SwiftUI")
                    .navigationBarTitle("내비게이션 바 타이틀")  // 기본값 - automatic
//                    .navigationBarTitle("내비게이션 바 타이틀", displayMode: .large)
//                    .navigationBarTitle("내비게이션 바 타이틀", displayMode: .inline)
            }
        }
    }
    
    struct Example03: View {
        var body: some View {
            // 내비게이션 바 왼쪽 아이템
            let leadingItem = Button(action: {}) {
                Image(systemName: "bell").imageScale(.large)
            }
            // 내비게이션 바 오른쪽 아이템
            let trailingItem = Button(action: {}) {
                Image(systemName: "gear").imageScale(.large)
            }
            return NavigationView {
                Image("SwiftUI")
                    .navigationBarItems(leading: leadingItem, trailing: trailingItem)
                    .navigationBarTitle("내비게이션 바 아이템")
            }
        }
    }
    
    struct Example04: View {
        var body: some View {
            NavigationView {
                // 이미지를 터치하면, Text("Destination View") 화면으로 전환됨
                NavigationLink(destination: Text("Destination View")) {
                    Image("SwiftUI")
                }
                .navigationBarTitle("내비게이션 링크")
            }
        }
    }
}
struct Ch04_02_Previews: PreviewProvider {
    static var previews: some View {
        Ch04_02()
    }
}
