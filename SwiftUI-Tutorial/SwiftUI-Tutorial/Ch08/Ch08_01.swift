//
//  Ch08_01.swift
//  SwiftUI-Tutorial
//
//  Created by NHN on 2021/06/04.
//

import SwiftUI

struct Ch08_01: View {
    var body: some View {
        Example01()
    }
}

private extension Ch08_01 {
    struct Example01: View {
        var body: some View {
            // modifier 수식어 또는 ModifiedContent 뷰를 이용해 ViewModifier 적용 가능
            Text("Custom ViewModifier")
                .modifier(Ch08_01.CustomViewModifier())
//            ModifiedContent(content: Text("Custom ViewModifier"), modifier: Ch08_01.CustomViewModifier())
        }
    }
    
    struct CustomViewModifier: ViewModifier {
        var borderColor: Color = .blue
        func body(content: Content) -> some View {
            content     // content = 화면에 출력할 뷰
                .font(.title)
                .foregroundColor(Color.white)
                .padding()
                .background(Rectangle().fill(Color.gray))
                .border(borderColor, width: 2)
        }
    }
}

struct Ch08_01_Previews: PreviewProvider {
    static var previews: some View {
        Ch08_01()
    }
}
