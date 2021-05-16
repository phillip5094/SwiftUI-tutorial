//
//  Ch03_02.swift
//  SwiftUI-Tutorial
//
//  Created by NHN on 2021/05/18.
//

import SwiftUI

struct Ch03_02: View {
    var body: some View {
        Example01()
    }
}

private extension Ch03_02 {
    struct Example01: View {
        var body: some View {
            VStack {
                HStack {
                    Rectangle()
                        .fill(Color.blue)
                        .frame(width: 100, height: 100)
                    Spacer()
                }
                Spacer()
            }
            .padding()
        }
    }
}
struct Ch03_02_Previews: PreviewProvider {
    static var previews: some View {
        Ch03_02()
    }
}
