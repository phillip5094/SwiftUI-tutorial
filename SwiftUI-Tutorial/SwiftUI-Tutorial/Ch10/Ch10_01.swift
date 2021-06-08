//
//  Ch10_01.swift
//  SwiftUI-Tutorial
//
//  Created by NHN on 2021/06/08.
//

import SwiftUI

struct Ch10_01: View {
    var body: some View {
        Example01()
    }
}

private extension Ch10_01 {
    struct Example01: View {
        @State private var pickedImage: Image = Image(systemName: "photo")
        @State private var isPickerPresented: Bool = false

        var body: some View {
            VStack {
                pickedImage
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 300)
                    .padding(.bottom)
                Button(action: { self.isPickerPresented.toggle() }) {
                    Text("Show ImagePicker").bold()
                }
                .sheet(isPresented: $isPickerPresented) {
                    ImagePickerView(pickedImage: $pickedImage)
                }
            }
        }
    }
}

fileprivate struct ImagePickerView: UIViewControllerRepresentable {
    @Binding var pickedImage: Image
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let imagePickerController = UIImagePickerController()
        // context 를 이용해 Coordinator 클래스를 delegate 에 지정
        imagePickerController.delegate = context.coordinator
        imagePickerController.allowsEditing = true
        return imagePickerController
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
    }

    final class Coordinator: NSObject {     // NSObject 상속
        let parent: ImagePickerView
        init(_ imagePickerView: ImagePickerView) {
            self.parent = imagePickerView
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)   // Context 에 전달할 Coordinator 지정
    }
}

extension ImagePickerView.Coordinator: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let originalImage = info[.originalImage] as! UIImage
        let editedImage = info[.editedImage] as? UIImage
        let selectedImage = editedImage ?? originalImage
        parent.pickedImage = Image(uiImage: selectedImage)  // 선택한 사진을 ImagePickerView 에 전달
        picker.dismiss(animated: true)
    }
}

struct Ch10_01_Previews: PreviewProvider {
    static var previews: some View {
        Ch10_01()
    }
}
