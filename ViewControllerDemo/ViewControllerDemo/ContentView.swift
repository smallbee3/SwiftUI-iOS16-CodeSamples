//
//  ContentView.swift
//  ViewControllerDemo
//
//  Created by Neil Smyth on 8/2/22.
//

import SwiftUI

struct ContentView: View {

    @State var imagePickerVisible: Bool = false
    @State var selectedImage: Image? = Image(systemName: "photo")

    var body: some View {
        ZStack {
            VStack {
                
                selectedImage?
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    
                Button(action: {
                    withAnimation {
                        self.imagePickerVisible.toggle()
                    }
                }) {
                    Text("Select an Image")
                }
                
            }.padding()
            
            if (imagePickerVisible) {
                MyImagePicker(imagePickerVisible:
                                $imagePickerVisible,
                                   selectedImage: $selectedImage)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
