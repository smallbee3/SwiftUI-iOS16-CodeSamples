//
//  ContentView.swift
//  ConcurrencyDemo
//
//  Created by Clark Song on 10/13/24.
//

import SwiftUI


// 24.9 await keyword
struct ContentView1: View {
    var body: some View {
        Button(action: {
            Task {
                await doSomething()
            }
        }) {
            Text("Do Something")
        }
    }
    
    func doSomething() async {
        print("Start \(Date())")
        await takesTooLong()
        print("End \(Date())")
    }
    
    func takesTooLong() async {
        sleep(3)
        print("Async task completed at \(Date())")
    }
}


// 24.10 async-let binding
struct ContentView2: View {
    var body: some View {
        Button(action: {
            Task {
                await doSomething()
            }
        }) {
            Text("Do Something")
        }
    }
    
    func doSomething() async {
        print("Start \(Date())")
//        await takesTooLong()
        async let result = takesTooLong()
        print("After async-let \(Date())")
        // Additional code to run concurrently with async function goes here
        print("result = \(await result)")
        print("End \(Date())")
    }
    
    func takesTooLong() async -> Date {
        sleep(3)
//        print("Async task completed at \(Date())")
        return Date()
    }
}


// 24.11 Error handling
enum DurationError: Error {
    case tooLong
    case tooShort
}

struct ContentView3: View {
    var body: some View {
        Button(action: {
            Task {
                await doSomething()
            }
        }) {
            Text("Do Something")
        }
    }
    
    func doSomething() async {
        print("Start \(Date())")
        do {
            try await takesTooLong(delay: 25)
        } catch DurationError.tooShort {
            print("Error: Duration too short")
        } catch DurationError.tooLong {
            print("Error: Duration too long")
        } catch {
            print("Unknown error")
        }
        print("End \(Date())")
    }
    
    func takesTooLong(delay: UInt32) async throws {
        if delay < 5 {
            throw DurationError.tooShort
        } else if delay > 20 {
            throw DurationError.tooLong
        }
        sleep(delay)
        print("Async task completed at \(Date())")
    }
}


// 24.16 작업 그룹
struct ContentView4: View {
    var body: some View {
        Button(action: {
            Task {
                await doSomething()
            }
        }) {
            Text("Do Something")
        }
    }
    
    func doSomething() async {
        await withTaskGroup(of: Void.self) { group in
            for i in 1...5 {
                group.addTask {
                    let result = await takesTooLong()
                    print("Completed Task \(i) = \(result)")
                }
            }
        }
     }

    func takesTooLong() async -> Date {
        sleep(3)
        return Date()
    }
}


// 24.18 for-await loop
struct ContentView5: View {
    var body: some View {
        Button(action: {
            Task {
                await doSomething()
            }
        }) {
            Text("Do Something")
        }
    }
    
    func doSomething() async {
        var timeStamps: [Int: Date] = [:]
        
        await withTaskGroup(of: (Int, Date).self) { group in
            for i in 1...5 {
                group.addTask {
                    return(i, await takesTooLong())
                }
            }
            
            for await (task, date) in group {
                timeStamps[task] = date
            }
        }
        
        for (task, date) in timeStamps {
            print("Task = \(task), Date = \(date)")
        }
    }

    func takesTooLong() async -> Date {
        sleep(5)
        return Date()
    }
}


// 24.19 (클래스 구조체 내에서) 비동기 속성
struct MyStruct {
    var myResult: Date {
        get async {
            return await self.getTime()
        }
    }
    func getTime() async -> Date {
        sleep(5)
        return Date()
    }
}

struct ContentView: View {
    var body: some View {
        Button(action: {
            Task {
                await doSomething()
            }
        }) {
            Text("Do Something")
        }
    }
    
    func doSomething() async {
        
        let myStruct = MyStruct()
        
        Task {
            let date = await myStruct.myResult
            print(date)
        }
    }
}


#Preview {
//    ContentView1()
//    ContentView2()
//    ContentView3()
    ContentView4()
//    ContentView5()
//    ContentView()
}
