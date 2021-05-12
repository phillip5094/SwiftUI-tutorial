//
//  Ch02_02.swift
//  SwiftUI-Tutorial
//
//  Created by NHN on 2021/05/13.
//

import SwiftUI

struct Ch02_02: View {
    var body: some View {
        Example01()
    }
}

private extension Ch02_02 {
    struct Example01: View {
        var body: some View {
            VStack {
                HStack (spacing: 0) {
                    // 프레임의 크기는 변하지만, 이미지의 크기는 변하지 않음.
                    Image("SwiftUI")
                    Image("SwiftUI")
                        .frame(width: 50, height: 50)
                    Image("SwiftUI")
                        .frame(width: 200, height: 200)
                }
                HStack (spacing: 0) {
                    // resizeable 수식어를 이용하여 이미지 크기 변경
                    Image("SwiftUI")
                    Image("SwiftUI")
                        .resizable()
                        .frame(width: 50, height: 50)
                    Image("SwiftUI")
                        .resizable()
                        .frame(width: 200, height:200)
                }
            }
        }
    }
    
    struct Example02: View {
        var body: some View {
            HStack {
                Image("SwiftUI")
                    .resizable()
                    .frame(width: 100, height: 100)
                Image("SwiftUI")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 150)
                Image("SwiftUI")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 150)
                    .clipped()  // 프레임 벗어나는 이미지 제거
            }
        }
    }
    
    struct Example03: View {
        var body: some View {
            HStack {
                Image("SwiftUI").clipShape(Circle())
                Image("SwiftUI").clipShape(
                    Rectangle().inset(by: 10)   // 사방으로 10씩 크기를 줄인 사각형
                )
            }
        }
    }
    
    struct Example04: View {
        var body: some View {
            VStack (spacing: 30) {
                HStack {
                    // 사용법
                    Image(systemName: "star.circle")
                    Image(systemName: "star.circle.fill")
                }
                HStack {
                    // 크기 조절
                    Image(systemName: "book.fill").imageScale(.small)
                    Image(systemName: "book.fill").imageScale(.medium)  // 기본값
                    Image(systemName: "book.fill").imageScale(.large)
                }
                HStack {
                    // 크기 조절
                    Image(systemName: "speaker.3").font(.body)
                    Image(systemName: "speaker.3").font(.title)
                    Image(systemName: "speaker.3").font(.system(size: 40))
                }
                HStack {
                    // 굵기 조절
                    Image(systemName: "arrow.up").font(Font.title.weight(.black))
                    Image(systemName: "arrow.up").font(Font.title.weight(.semibold))
                    Image(systemName: "arrow.up").font(Font.title.weight(.light))
                    Image(systemName: "arrow.up").font(Font.title.weight(.ultraLight))
                }
            }
        }
    }
}

struct Ch02_02_Previews: PreviewProvider {
    static var previews: some View {
        Ch02_02()
    }
}
