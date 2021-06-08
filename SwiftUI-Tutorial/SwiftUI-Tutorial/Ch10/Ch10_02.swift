//
//  Ch10_02.swift
//  SwiftUI-Tutorial
//
//  Created by NHN on 2021/06/08.
//

import SwiftUI
import MapKit

struct Ch10_02: View {
    var body: some View {
        Example01()
    }
}

private extension Ch10_02 {
    struct Example01: View {
        @State private var coordinate = CLLocationCoordinate2DMake(37.551416, 126.988194)
        let locations: [String: CLLocationCoordinate2D] = [
            "남산": CLLocationCoordinate2DMake(37.551416, 126.988194),
            "시청": CLLocationCoordinate2DMake(37.566308, 126.977948),
            "국회": CLLocationCoordinate2DMake(37.531830, 126.914187)
        ]
        
        var body: some View {
            ZStack(alignment: .bottom) {
                MapView(coordinate: coordinate)
                HStack(spacing: 30) {
                    ForEach(["남산", "시청", "국회"], id: \.self) { location in
                        Button(action: { self.coordinate = self.locations[location]! }) {
                            Text(location)
                                .font(.largeTitle)
                                .foregroundColor(.white)
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 8).fill(Color.blue))
                        }
                    }
                }.padding(.bottom, 40)
            }.edgesIgnoringSafeArea(.all)
        }
    }
}

fileprivate struct MapView: UIViewRepresentable {
    let coordinate: CLLocationCoordinate2D      // 위치 정보를 전달받음
    
    func makeUIView(context: Context) -> MKMapView {
        MKMapView()
    }
    
    // 위치 좌표를 바꿀 때마다 updateUIView 메서드로 맵뷰 갱신
    func updateUIView(_ uiView: MKMapView, context: Context) {
        let camera = MKMapCamera(
            lookingAtCenter: coordinate,    // 지도의 중앙 위치
            fromDistance: 2500,             // 지정한 중앙 위치로부 터 카메라의 거리
            pitch: 45,                      // 카메라 각도
            heading: 0                      // 방향
        )
        uiView.setCamera(camera, animated: true)
    }
}

struct Ch10_02_Previews: PreviewProvider {
    static var previews: some View {
        Ch10_02()
    }
}
