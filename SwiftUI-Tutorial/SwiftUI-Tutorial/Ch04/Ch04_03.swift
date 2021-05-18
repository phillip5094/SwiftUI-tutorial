//
//  Ch04_03.swift
//  SwiftUI-Tutorial
//
//  Created by NHN on 2021/05/19.
//

import SwiftUI

struct Ch04_03: View {
    var body: some View {
        Example01()
    }
}

private extension Ch04_03 {
    struct Example01: View {
        var body: some View {
            List {
                Text("List").font(.largeTitle)
                Image("SwiftUI")
                Circle().frame(width: 100, height: 100)
                Color(.red).frame(width: 100, height: 100)
            }
        }
    }
    
    struct Example02: View {
        var body: some View {
            List {
                ForEach(0..<50) {
                    Text("\($0)")
                }
            }
        }
    }

    struct Example03: View {
        var body: some View {
            // Swift 기본타입이므로 이미 Hashable 프로토콜 준수한 상태. self 사용
            List(["A", "B", "C", "D", "E"], id: \.self) {
                Text($0)
            }
        }
    }
    
    struct Example04: View {
        var body: some View {
            // 식별을 위한 프로퍼티 지정, Hashable 프로토콜 채택
            List([User(name: "Steve"), User(name: "James")], id: \.name) {
                Text($0.name)
            }
        }
    }
    
    struct Example05: View {
        var body: some View {
            List([Animal(name: "Tory"), Animal(name: "Lilly")]) {
                Text($0.name)
            }
        }
    }
    
    struct Example06: View {
        var body: some View {
            let fruits = ["사과", "배", "포도", "바나나"]
            let drinks = ["물", "우유", "탄산수"]
            
            let titles = ["Fruits", "Drinks"]
            let data = [fruits, drinks]
            
            return List {
                ForEach(data.indices) { index in
                    Section(header: Text(titles[index]).font(.title), footer: HStack{ Spacer(); Text("\(data[index].count)건") }) {
                        ForEach(data[index], id: \.self) {
                            Text($0)
                        }
                    }
                }
            }
            .listStyle(PlainListStyle())
//            .listStyle(GroupedListStyle())
//            .listStyle(InsetGroupedListStyle())
        }
    }
}

// User 라는 커스텀 타입
struct User {
    let name: String
}
// Hashable 프로토콜 채택
extension User: Hashable {}

// Identifiable 프로토콜 채택
struct Animal: Identifiable {
    let id = UUID()
    let name: String
}

struct Ch04_03_Previews: PreviewProvider {
    static var previews: some View {
        Ch04_03()
    }
}
