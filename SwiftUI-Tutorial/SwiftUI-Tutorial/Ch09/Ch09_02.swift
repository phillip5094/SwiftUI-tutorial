//
//  Ch09_02.swift
//  SwiftUI-Tutorial
//
//  Created by NHN on 2021/06/07.
//

import SwiftUI

struct Ch09_02: View {
    var body: some View {
        Example01()
    }
}

private extension Ch09_02 {
    struct Example01: View {
        @State private var showText = false
        var body: some View {
            VStack {
                if showText {
                    Text("Transition")
                        .font(.largeTitle)
                        .padding()
                }
                
                Button("Display Text On / Off") {
                    withAnimation {
                        self.showText.toggle()
                    }
                }.font(.title)
                
            }
        }
    }
    
    struct Example02: View {
        @State private var showText = false
        var body: some View {
            VStack(spacing: 30) {
                Button("Display Text On / Off") {
                    withAnimation{ self.showText.toggle() }
                }.padding()
                
                Spacer()
                
                if showText {
                    Text("Opacity").padding()
                        .transition(.opacity)
                    Text("Scale").padding()
                        .transition(.scale)
                    Text("Slide").padding()
                        .transition(.slide)
                    Text("Offset").padding()
                        .transition(.offset(x: 100, y: 100))
                    Text("Move").padding()
                        .transition(.move(edge: .bottom))
                }
            }
        }
    }
    
}

struct Ch09_02_Previews: PreviewProvider {
    static var previews: some View {
        Ch09_02()
    }
}
