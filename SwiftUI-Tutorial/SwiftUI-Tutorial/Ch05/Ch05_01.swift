//
//  Ch05_01.swift
//  SwiftUI-Tutorial
//
//  Created by NHN on 2021/05/31.
//

import SwiftUI

struct Ch05_01: View {
    var body: some View {
        Example01()
    }
}

struct Ch05_01_Example02: View {
    var body: some View {
        List {
            Image("cat").resizable().scaledToFit()
            Image("dog").resizable().scaledToFit()
        }
    }
}

struct Ch05_01_Example03: View {
    var body: some View {
        HStack {
            Image("cat")
                .resizable().scaledToFill()
                .frame(width: 80, height: 80)
                .clipped()
            Text("Cat").font(.title)
            Image("dog")
                .resizable().scaledToFill()
                .frame(width: 80, height: 80)
                .clipped()
            Text("Dog").font(.title)
        }
    }
}

private extension Ch05_01 {
    struct Example01: View {
        var body: some View {
            Text("이것은 프리뷰 입니다.")
        }
    }
}

struct Ch05_01_Previews: PreviewProvider {
    static var previews: some View {
        Ch05_01()
    }
}


struct Example02_Previews_1: PreviewProvider {
    static var previews: some View {
        Ch05_01_Example02()
            .previewDevice(PreviewDevice(rawValue: "iPhone 11 Pro"))
    }
}

struct Example02_Previews_2: PreviewProvider {
    static var previews: some View {
//        Group {
//            Ch05_01()
//                .previewDevice(PreviewDevice(rawValue: "iPhone 11 Pro"))
//            Ch05_01()
//                .previewDevice(PreviewDevice(rawValue: "iPhone 8"))
//        }
        ForEach(["iPhone 11 Pro", "iPhone 8"], id: \.self) {
            Ch05_01_Example02().previewDevice(PreviewDevice(rawValue: $0))
        }
    }
}

struct Example02_Previews_3: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone 11 Pro", "iPhone 8"], id: \.self) {
            Ch05_01_Example02().previewDevice(PreviewDevice(rawValue: $0))
                .previewDisplayName($0)
        }
    }
}

struct Example03_Previews_1: PreviewProvider {
    static var previews: some View {
        Group {
            Ch05_01_Example03().previewLayout(.device).previewDisplayName("device")
            Ch05_01_Example03().previewLayout(.sizeThatFits).previewDisplayName("sizeThatFits")
            Ch05_01_Example03().previewLayout(.fixed(width: 350, height: 150)).previewDisplayName("fixed")
        }
    }
}
