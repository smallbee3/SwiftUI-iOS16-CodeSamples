//
//  30_4_refresh_list.swift
//  SwiftUI_List
//
//  Created by Clark Song on 1/30/25.
//

import SwiftUI

struct ToDoItem: Identifiable {
    var id = UUID()
    var task: String
    var imageName: String
}

struct _30_4_refresh_list: View {
    @State private var toggleStatus = true
    
    @State var listData: [ToDoItem] = [
            ToDoItem(task: "Take out trash", imageName: "trash.circle.fill"),
            ToDoItem(task: "Pick up the kids", imageName: "person.2.fill"),
            ToDoItem(task: "Wash the car", imageName: "car.fill")
    ]
    
    var body: some View {
        List {
            Section(header: Text("Settings")) {
                Toggle(isOn: $toggleStatus) {
                    Text("Allow Notifications")
                }
            }
            Section(header: Text("To Do Tasks")) {
                ForEach(listData) { item in
                    HStack {
                        Image(systemName: item.imageName)
                        Text(item.task)
                    }
                }
            }
        }
        .refreshable{
            listData = [
                ToDoItem(task: "Order dinner", imageName: "dollarsign.circle.fill"),
                ToDoItem(task: "Call financial advisor", imageName: "phone.fill"),
                ToDoItem(task: "Sell the kids", imageName: "person.2.fill")
            ]
        }
    }
}

#Preview {
    _30_4_refresh_list()
}
