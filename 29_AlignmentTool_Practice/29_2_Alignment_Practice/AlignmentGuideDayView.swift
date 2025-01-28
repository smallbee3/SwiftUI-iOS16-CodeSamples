//
//  DayView.swift
//  29_2_Alignment_Practice
//
//  Created by Clark Song on 1/27/25.
//

import SwiftUI

struct AlignmentGuideDayView: View {
    
    var body: some View {
        
        VStack(alignment: HorizontalAlignment.center) {
            Day(label: "")
                .alignmentGuide(HorizontalAlignment.center, computeValue: { dimension in
//                    0
                    10
//                    -10
                })
            Day(label: "")
                .alignmentGuide(HorizontalAlignment.center, computeValue: { dimension in
//                    dimension[.leading]
                    dimension[.trailing]
//                    dimension[HorizontalAlignment.center]
                })
            Day(label: "")
            Day(label: "")
            Day(label: "")
            Day(label: "")
            Day(label: "")
            
        }
        .frame(width: 200)
        .padding(.vertical)
        .border(Color.gray)
    }
}

struct Day: View {
    let label: String
    var body: some View {
        
        Text(label)
//            .padding(10)
            .frame(width: 50, height: 50)
            .background(RoundedRectangle(cornerRadius: 8)
                .fill(Color.red.opacity(0.9))
            )
            .foregroundColor(.white)
    }
}

#Preview {
    AlignmentGuideDayView()
}
