//
//  Ch07_01.swift
//  SwiftUI-Tutorial
//
//  Created by NHN on 2021/06/02.
//

import SwiftUI

struct Ch07_01: View {
    var body: some View {
        Example01()
    }
}

private extension Ch07_01 {
    struct Example01: View {
        @State private var showingAlert = false
        
        var body: some View {
            Button(action: { self.showingAlert = true }) {
                Text("Alert")
            }
            .alert(isPresented: $showingAlert) {    // showingAlert = true 되면 Alert 표시
                Alert(title: Text("제목"),
                      message: Text("내용"),
                      primaryButton: .default(Text("확인")),
                      secondaryButton: .cancel(Text("취소")))
            }
        }
    }
    
    struct Example02: View {
        @State private var showingAlert = false
        
        var body: some View {
            Button(action: { self.showingAlert = true }) {
                Text("Alert")
            }
            .alert(isPresented: $showingAlert) {
                Alert(title: Text("버튼 스타일"),
                      message: Text("destructive 타입은 빨간색 버튼"),
                      primaryButton: .destructive(Text("destructive")),     // 빨간색으로 강조된 버튼
                      secondaryButton: .default(Text("default")))
            }
        }
    }
    
    struct Example03: View {
        @State private var showingAlert = false
        
        var body: some View {
            Button(action: { self.showingAlert = true }) {
                Text("Alert")
            }
            .alert(isPresented: $showingAlert) {
                // 버튼을 추가안해도 OK 버튼이 자동으로 생성
                Alert(title: Text("버튼 0개"), message: Text("OK 버튼 자동으로 추가"))
            }
        }
    }
}

struct Ch07_01_Previews: PreviewProvider {
    static var previews: some View {
        Ch07_01()
    }
}
