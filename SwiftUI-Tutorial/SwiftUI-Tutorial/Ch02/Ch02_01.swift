//
//  Ch02_01.swift
//  SwiftUI-Tutorial
//
//  Created by NHN on 2021/05/12.
//

import SwiftUI

struct Ch02_01: View {
    var body: some View {
        Example01()
    }
}

private extension Ch02_01 {
    struct Example01: View {
        var body: some View {
            VStack (spacing: 30) {
                Text("폰트와 굵기 설정" )
                    .font(.title)       // 폰트 설정
                    .fontWeight(.bold)  // 폰트 굵기
                
                Text("foreground = 글자색, background = 배경색")
                    .foregroundColor(.white)    // 글자색
                    .padding()                  // 텍스트 주변 여백 생성
                    .background(Color.blue)     // 배경색
                
                Text("커스텀 폰트, 볼드체, 이탤릭체, 밑줄, 취소선")
                    .font(.custom("Menlo", size: 16))   // 커스텀 폰트 설정
                    .bold()                             // 볼드체
                    .italic()                           // 이탤릭체
                    .underline()                        // 밑줄
                    .strikethrough()                    // 취소선
            }
        }
    }
    
    struct Example02: View {
        var body: some View {
            VStack {
                // 수식어 순서에 따라서 결과가 달라질 수 있으니 조심하자.
                Text("ABCDE")
                    .font(.largeTitle)
                    .padding()
                    .background(Color.yellow)
                
                Text("ABCDE")
                    .font(.largeTitle)
                    .background(Color.yellow)
                    .padding()
            }
        }
    }
}

struct Ch02_01_Previews: PreviewProvider {
    static var previews: some View {
        Ch02_01()
    }
}
