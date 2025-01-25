//
//  MyImagePicker.swift
//  ViewControllerDemo
//
//  Created by Neil Smyth on 8/2/22.
//

import SwiftUI

struct MyImagePicker: UIViewControllerRepresentable {

    @Binding var imagePickerVisible: Bool
    @Binding var selectedImage: Image?

    func makeUIViewController(context:
              UIViewControllerRepresentableContext<MyImagePicker>) ->
                      UIImagePickerController {
        let picker = UIImagePickerController()
                          picker.delegate = context.coordinator

        return picker
    }

    func updateUIViewController(_ uiViewController:
            UIImagePickerController, context:
              UIViewControllerRepresentableContext<MyImagePicker>) {

    }
    
    class Coordinator: NSObject, UINavigationControllerDelegate,
                         UIImagePickerControllerDelegate {
    
        @Binding var imagePickerVisible: Bool
        @Binding var selectedImage: Image?
    
        init(imagePickerVisible: Binding<Bool>,
                          selectedImage: Binding<Image?>) {
            _imagePickerVisible = imagePickerVisible
            _selectedImage = selectedImage
        }
    
        func imagePickerController(_ picker: UIImagePickerController,
                                   didFinishPickingMediaWithInfo
                    info: [UIImagePickerController.InfoKey : Any]) {
            let uiImage =
                info[UIImagePickerController.InfoKey.originalImage] as!
                                                                   UIImage
            selectedImage = Image(uiImage: uiImage)
            imagePickerVisible = false
        }
    
        func imagePickerControllerDidCancel(_
                            picker: UIImagePickerController) {
            imagePickerVisible = false
        }
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(imagePickerVisible: $imagePickerVisible,
                                selectedImage: $selectedImage)
    }
}

/*
 struct MyImagePicker_Previews: PreviewProvider {
     static var previews: some View {
         MyImagePicker()
     }
 }
 */
