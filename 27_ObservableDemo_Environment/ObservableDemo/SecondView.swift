//
//  SecondView.swift
//  ObservableDemo
//
//  Created by Neil Smyth on 9/12/22.
//

import SwiftUI

struct SecondView: View {
    
//    @StateObject var timerData: TimerData
    @EnvironmentObject var timerData: TimerData

    var body: some View {
        VStack {
            Text("Second View")
                .font(.largeTitle)
            Text("Timer Count = \(timerData.timeCount)")
                .font(.headline)
        }
        .padding()
    }
}

#Preview {
//    SecondView(timerData: TimerData())
    SecondView()
        .environmentObject(TimerData())
}
