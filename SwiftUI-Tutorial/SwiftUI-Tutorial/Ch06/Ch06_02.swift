//
//  Ch06_02.swift
//  SwiftUI-Tutorial
//
//  Created by NHN on 2021/06/01.
//

import SwiftUI

struct Ch06_02: View {
    var body: some View {
        Example01()
//        Example02(user: User())
    }
}

private extension Ch06_02 {
    struct Example01: View {
        @State private var isFavorite = true    // 토글의 상태 저장
        @State private var count = 0            // 스테퍼의 상태 저장
        
        var body: some View {
            VStack(spacing: 30) {
                Toggle(isOn: $isFavorite) {     // $ 접두어를 사용하면 State 프로퍼티를 참조함 -> 값이 갱신이 됨.
                    Text("isFavorite: \(isFavorite.description)")   // State 프로퍼티를 그냥 읽을 땐 $접두어는 필요 없음
                }
                Stepper("Count: \(count)", value: $count)
            }
        }
    }
    
    class User: ObservableObject {  // ObservableObject 프로토콜 준수
        let name = "User Name"
        @Published var score = 0    // score 값이 바뀌면 User 를 관찰하는 모든 뷰한테 알려줌
    }
    
    struct Example02: View {
        @ObservedObject var user: User  // User 클래스 관찰
        
        var body: some View {
            VStack(spacing: 30) {
                Text(user.name)
                Button(action: { self.user.score += 1 }) {
                    Text(user.score.description)
                }
            }
        }
    }
    
    struct Example03: View {
        var body: some View {
            Ch06_02.SuperView().environmentObject(Ch06_02.User())   // SuperView 의 모든 자식뷰는 User 인스턴스에 접근 가능
        }
    }
    
    struct SuperView: View {
        var body: some View { Ch06_02.SubView() }
    }
    
    struct SubView: View {
        @EnvironmentObject var user: User       // 값을 대입하지 않았어도, 위에서 전달한 User 인스턴스를 사용
        var body: some View {
            Text(user.name.description)
        }
    }
}

struct Ch06_02_Previews: PreviewProvider {
    static var previews: some View {
        Ch06_02()
    }
}
