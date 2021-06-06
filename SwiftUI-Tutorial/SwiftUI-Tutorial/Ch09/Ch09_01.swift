//
//  Ch09_01.swift
//  SwiftUI-Tutorial
//
//  Created by NHN on 2021/06/06.
//

import SwiftUI

struct Ch09_01: View {
    var body: some View {
        Example01()
    }
}

private extension Ch09_01 {
    struct Example01: View {
        @State private var blur: Bool = false
        @State private var reduction: Bool = false
        
        var body: some View {
            Image("cat")
                .blur(radius: blur ? 5 : 0)
                .scaleEffect(reduction ? 0.7 : 1 )
                .onTapGesture {
                    self.blur.toggle()
                    self.reduction.toggle()
                }
                .animation(.default)    // 애니메이션 수식어
        }
    }
    
    struct Example02: View {
        @State private var blur: Bool = false
        @State private var reduction: Bool = false
        
        var body: some View {
            Image("cat")
                .blur(radius: blur ? 5 : 0)     // blur 애니메이션 적용
                .onTapGesture {
                    self.blur.toggle()
                    self.reduction.toggle()
                }
                .animation(.default)
                .scaleEffect(reduction ? 0.7 : 1 )  // scale 에 대한 애니메이션은 적용 안됨
        }
    }
    
    struct Example03: View {
        @State private var rotateImage: Bool = false
        var body: some View {
            VStack {
                Button(action: {
                        withAnimation {
                            // rotateImage 변수 값이 변하면,
                            // 그 변수를 사용하는 모든 뷰에 애니메이션을 적용
                            self.rotateImage.toggle()
                        }
                }) {
                    Text("Rotate Image")
                }
                
                Image(systemName: "chevron.right.circle")
                    .imageScale(.large)
                    .rotationEffect(.degrees(rotateImage ? 90 : 0)) // 애니메이션을 적용하지 않았지만, withAnimation 함수로 인하여 애니메이션이 적용됨
                    .scaleEffect(2)
                    .frame(width: 100, height: 100)
                    .padding()
            }
        }
    }
    
    struct Example04: View {
        @State private var blur: Bool = false
        @State private var reduction: Bool = false
        
        var body: some View {
            Image("cat")
                .blur(radius: blur ? 5 : 0)
                // 속도 2배 & blur 애니메이션 5번 반복
                // blur 5 -> blur 0 -> blur 5 -> blur 0 -> blur 5
                .animation(Animation.default.speed(2).repeatCount(5, autoreverses: true))
                .scaleEffect(reduction ? 0.7 : 1)
                // 2초 delay 후 이미지 크기 작아짐
                .animation(Animation.default.delay(2))
                .onTapGesture {
                    self.blur.toggle()
                    self.reduction.toggle()
                }
        }
    }
}

struct Ch09_01_Previews: PreviewProvider {
    static var previews: some View {
        Ch09_01()
    }
}
