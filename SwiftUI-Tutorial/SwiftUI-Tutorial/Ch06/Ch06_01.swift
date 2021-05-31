//
//  Ch06_01.swift
//  SwiftUI-Tutorial
//
//  Created by NHN on 2021/05/31.
//

import SwiftUI

struct Ch06_01: View {
    var body: some View {
        Example01()
    }
}

private extension Ch06_01 {
    struct Example01: View {
        var framework: String = "UIKit"
//        @State var framework: String = "UIKit"    // @State 속성을 사용하면 body 내에서 값 변경 가능
        var body: some View {
            Button(framework) {
                // Cannot assign to property: 'self' is immutable
                self.framework = "SwiftUI"  // 버튼 클릭 시 framework 값을 변경하고 싶지만 컴파일 에러 발생
            }
        }
    }
}

struct Ch06_01_Previews: PreviewProvider {
    static var previews: some View {
        Ch06_01()
    }
}
