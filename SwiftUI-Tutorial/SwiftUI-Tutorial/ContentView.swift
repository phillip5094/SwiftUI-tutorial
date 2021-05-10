//
//  ContentView.swift
//  SwiftUI-Tutorial
//
//  Created by NHN on 2021/05/11.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Hello, world!")
                .padding()
            
            Text("Hello ") + Text("SwiftUI")
            
            Text("Hello SwiftUI")
                .foregroundColor(.green)
                .italic()
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
