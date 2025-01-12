//
//  SecondView.swift
//  ObservableDemo
//
//  Created by Clark Song on 1/19/25.
//

import SwiftUI

struct SecondView: View {
    
    @StateObject var timerData: TimerData

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
    SecondView(timerData: TimerData())
}
