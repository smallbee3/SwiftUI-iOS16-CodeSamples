//
//  ContentView.swift
//  DemoProject
//
//  Created by Neil Smyth on 7/22/22.
//

import SwiftUI

struct ContentView: View {
    @State var myLayout: AnyLayout = AnyLayout(VStackLayout())
    
    var body: some View {
        VStack {
          myLayout {
            Image(systemName: "goforward.10")
              .resizable()
              .aspectRatio(contentMode: .fit)
            Image(systemName: "goforward.15")
              .resizable()
              .aspectRatio(contentMode: .fit)
          }
          
          HStack {
            Button(action: {
              myLayout = AnyLayout(HStackLayout())
            }) {
              Text("HStack")
            }
            Button(action: {
              myLayout = AnyLayout(VStackLayout())
            }) {
              Text("VStack")
            }
          }
        }
    }
}

//#Preview {
//    ContentView()
////        .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
//        .previewDevice("iPhone SE (3rd generation)")
////        .previewDevice("iPhone 15 Pro")
////        .previewDisplayName("iPhone SE")
//}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .previewDevice("iPhone 13")
                .previewDisplayName("iPhone 13")
            ContentView()
                .previewDevice("iPhone SE (2nd generation)")
                .previewDisplayName("iPhone SE")
        }

    }
}
