//
//  Ch08_02.swift
//  SwiftUI-Tutorial
//
//  Created by NHN on 2021/06/04.
//

import SwiftUI

struct Ch08_02: View {
    var body: some View {
        Example01()
    }
}

private extension Ch08_02 {
    struct Example01: View {
        init() {    // 생성자에서 스타일 지정
            UINavigationBar.appearance().largeTitleTextAttributes = [
                .foregroundColor: UIColor.systemTeal,   // 글자 색상 변경
                .kern: 5        // 자간 변경
            ]
        }
        
        var body: some View {
            NavigationView {
                Text("Hello World")
                    .navigationBarTitle("UIAppearance")     // 스타일을 지정해주지 않아도 내비게이션 뷰에 일괄 적용됨
            }
        }
    }
}

struct Ch08_02_Previews: PreviewProvider {
    static var previews: some View {
        Ch08_02()
    }
}
