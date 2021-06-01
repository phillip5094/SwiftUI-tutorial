//
//  Ch07_03.swift
//  SwiftUI-Tutorial
//
//  Created by NHN on 2021/06/02.
//

import SwiftUI

struct Ch07_03: View {
    var body: some View {
        Example01()
    }
}

private extension Ch07_03 {
    struct Example01: View {
        @State private var showingSheet = false
        var body: some View {
            Button(action: { self.showingSheet.toggle() }) {
                Text("Present")
                    .font(.title).foregroundColor(.blue)
            }
            .sheet(isPresented: $showingSheet,
                   onDismiss: { print("Dismissed") },   // 화면이 닫히기 전 수행할 작업
                   content: { Ch07_03.PresentedView(isPresented: $showingSheet) } // 새로 출력될 화면
            )
        }
    }
    
    struct PresentedView: View {
        @Binding var isPresented: Bool
        var body: some View {
            Button(action: { self.isPresented = false }) {
                Text("Tap to Dismiss")
                    .font(.title).foregroundColor(.red)
            }
        }
    }
    
    struct Example02: View {
        @State private var showingPopover = false
        var body: some View {
            Button(action: {self.showingPopover.toggle() }) {
                Text("Popover Button").font(.largeTitle)
            }
            .popover(isPresented: $showingPopover,
                     attachmentAnchor: .rect(.bounds),
                     arrowEdge: .top) {     // Popover 뷰의 화살표 방향
                Text("Popover")
            }
        }
    }
}

struct Ch07_03_Previews: PreviewProvider {
    static var previews: some View {
        Ch07_03()
            .previewDevice("iPad Pro (9.7-inch)")
    }
}
