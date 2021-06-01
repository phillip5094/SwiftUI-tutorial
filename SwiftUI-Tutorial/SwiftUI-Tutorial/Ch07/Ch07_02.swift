//
//  Ch07_02.swift
//  SwiftUI-Tutorial
//
//  Created by NHN on 2021/06/02.
//

import SwiftUI

struct Ch07_02: View {
    var body: some View {
        Example01()
    }
}

private extension Ch07_02 {
    struct Example01: View {
        @State private var showingActionSheet = false
        
        var body: some View {
            Button(action: { self.showingActionSheet = true }) {
                Text("ActionSheet")
            }
            .actionSheet(isPresented: $showingActionSheet) {
                ActionSheet(title: Text("ActionSheet"),
                            message: Text("버튼을 배열형태로 전달받음"),
                            buttons: [
                                .default(Text("default 버튼1")),
                                .default(Text("default 버튼2")),
                                .destructive(Text("destructive 버튼")),
                                .cancel(Text("cancel 버튼"))
                            ]
                )
            }
        }
    }
    
    struct Example02: View {
        @State private var showingActionSheet = false
        
        var body: some View {
            Button(action: { self.showingActionSheet = true }) {
                Text("ActionSheet")
            }
            .actionSheet(isPresented: $showingActionSheet) {
                ActionSheet(title: Text("ActionSheet"),
                            message: Text("버튼 생략하면 Cancel 버튼 자동으로 추가")
                )
                
            }
        }
    }
}

struct Ch07_02_Previews: PreviewProvider {
    static var previews: some View {
        Ch07_02()
    }
}
