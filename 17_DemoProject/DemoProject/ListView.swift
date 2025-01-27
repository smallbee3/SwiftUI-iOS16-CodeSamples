//
//  ListView.swift
//  DemoProject
//
//  Created by Clark Song on 1/28/25.
//

import SwiftUI

struct ListView: View {
    var body: some View {
        VStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        }
        List(/*@START_MENU_TOKEN@*/0 ..< 5/*@END_MENU_TOKEN@*/) { item in
            Text("Hello, World2! \(item)")
        }
    }
}

#Preview {
    ListView()
}
