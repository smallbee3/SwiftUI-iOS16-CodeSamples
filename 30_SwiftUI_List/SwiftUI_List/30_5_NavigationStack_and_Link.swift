//
//  30_4_refresh_list.swift
//  SwiftUI_List
//
//  Created by Clark Song on 1/30/25.
//

import SwiftUI

//struct ToDoItem: Identifiable {
//    var id = UUID()
//    var task: String
//    var imageName: String
//}

struct _30_5_NavigationStack_and_Link: View {
    @State private var toggleStatus = true
    
    @State var listData: [ToDoItem] = [
        ToDoItem(task: "Take out trash", imageName: "trash.circle.fill"),
        ToDoItem(task: "Pick up the kids", imageName: "person.2.fill"),
        ToDoItem(task: "Wash the car", imageName: "car.fill")
    ]
    
    // 30.7 내비게이션 경로로 작업하기
    @State private var stackPath = NavigationPath()
    // ---
    
    // 30.8 내비게이션 바 customization
    func addTask() {
        print("addTask is triggered")
    }
    // ---
    
    // 30.9 편집가능하게 만들기 - a
    func deleteItem(at offsets: IndexSet) {
        print("deleteItem is triggered, index: \(offsets)")
    }
    // ---
    // 30.9 편집가능하게 만들기 - b
    func moveItem(from source: IndexSet, to destination: Int) {
        print("moveItem is triggered, index: \(source), destination: \(destination)")
    }
    // ---
    
    var body: some View {
//        NavigationStack {
        // 30.7 내비게이션 경로로 작업하기
        NavigationStack(path: $stackPath) {
        // ---
            List {
                Section(header: Text("Settings")) {
                    Toggle(isOn: $toggleStatus) {
                        Text("Allow Notifications")
                    }
                    
                    // 30.6 값 타입별 내비게이션
                    NavigationLink(value: listData.count) { Text("View Task Count")
                    }
                    // ---
                }
                Section(header: Text("To Do Tasks")) {
                    ForEach(listData) { item in
                        NavigationLink(value: item.task) {
                            HStack {
                                Image(systemName: item.imageName)
                                Text(item.task)
                            }
                        }
                    }
                    // 30.9 편집가능하게 만들기 - a
                    .onDelete(perform: deleteItem)
                    // ---
                    // 30.9 편집가능하게 만들기 - b
                    .onMove(perform: moveItem)
                    // ---
                }
            }
            .refreshable{
                listData = [
                    ToDoItem(task: "Order dinner", imageName: "dollarsign.circle.fill"),
                    ToDoItem(task: "Call financial advisor", imageName: "phone.fill"),
                    ToDoItem(task: "Sell the kids", imageName: "person.2.fill")
                ]
            }
            .navigationDestination(for: String.self) { task in Text("Selected task = \(task)")
            }
            // 30.6 값 타입별 내비게이션
            .navigationDestination(for: Int.self) { count in Text("Number of tasks = \(count)")
            }
            // ---
            // 30.8 내비게이션 바 customization
            .navigationBarTitle(Text("To Do List"))
            .navigationBarItems(trailing: Button(action: addTask) {
                Text("Add")
            })
            // ---
        }
    }
}

#Preview {
    _30_5_NavigationStack_and_Link()
}
