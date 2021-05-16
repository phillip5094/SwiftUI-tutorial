//
//  Ch03_01.swift
//  SwiftUI-Tutorial
//
//  Created by NHN on 2021/05/16.
//

import SwiftUI

struct Ch03_01: View {
    var body: some View {
        Example01()
    }
}


private extension Ch03_01 {
    struct Example01: View {
        var body: some View {
            VStack(spacing: 20) {
                HStack {
                    Text("HStack : ")
                    // 뷰를 수평으로 배치
                    HStack {
                        Rectangle()
                            .fill(Color.green)
                            .frame(width: 150, height: 150)
                        Rectangle()
                            .fill(Color.yellow)
                            .frame(width: 150, height: 150)
                    }
                }
                
                HStack {
                    Text("VStack : ")
                    // 뷰를 수직으로 배치
                    VStack {
                        Rectangle()
                            .fill(Color.green)
                            .frame(width: 150, height: 150)
                        Rectangle()
                            .fill(Color.yellow)
                            .frame(width: 150, height: 150)
                    }
                }
                
                HStack {
                    Text("ZStack : ")
                    // 뷰를 겹겹이 배치
                    ZStack {
                        Rectangle()
                            .fill(Color.green)
                            .frame(width: 150, height: 150)
                        Rectangle()
                            .fill(Color.yellow)
                            .frame(width: 150, height: 150)
                            .offset(x: 40, y: 40)       // x축, y축으로 40 포인트 이동
                    }
                }
            }
        }
    }
    
    struct Example02: View {
        var body: some View {
            HStack {
                Text("HStack").font(.title).foregroundColor(Color.blue)     // title 폰트 적용
                Text("은 뷰를 가로로 배열합니다.")     // largeTitle 폰트 적용
                Text("!")                       // laregeTitle 폰트 적용
            }
            .padding()
            .border(Color.black)
            .font(.largeTitle)
        }
    }
    
    struct Example03: View {
        var body: some View {
            HStack(spacing: 40) {
                Rectangle().fill(Color.green).frame(width: 150, height: 150)
                    .overlay(   // 초록색 사각형 위로 뷰 추가
                        Rectangle().fill(Color.yellow).offset(x: 30, y: 30) // 크기를 정해주지 않으면 초록색 사각형과 동일 크기
                    )
                
                Rectangle().fill(Color.yellow).frame(width: 150, height: 150)
                    .background(   // 노란색 사각형 아래에 뷰 추가
                        Rectangle().fill(Color.green).offset(x: 30, y: 30) // 크기를 정해주지 않으면 노란색 사각형과 동일 크기
                    )
            }
        }
    }
}
struct Ch03_01_Previews: PreviewProvider {
    static var previews: some View {
        Ch03_01()
    }
}
