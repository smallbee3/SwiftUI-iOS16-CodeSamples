//
//  SceneStorageView.swift
//  StorageDemo
//
//  Created by Neil Smyth on 7/26/22.
//

import SwiftUI

struct SceneStorageView: View {
    
    // SceneStorage 사용 전
//    @State private var editorText: String = ""
    
    // SceneStorage 사용 후
    @SceneStorage("mytext") private var editorText: String = ""

    var body: some View {
        TextEditor(text: $editorText)
            .padding(30)
            .font(.largeTitle)
    }
}


struct SceneStorageView_Previews: PreviewProvider {
    static var previews: some View {
        SceneStorageView()
    }
}
