//
//  DayView.swift
//  29_2_Alignment_Practice
//
//  Created by Clark Song on 1/27/25.
//

import SwiftUI

extension HorizontalAlignment {
    enum MyCustomAlignment: AlignmentID {
        static func defaultValue(in d: ViewDimensions) -> CGFloat {
            d.height
        }
    }
    
    static let myCustomALignment = HorizontalAlignment(MyCustomAlignment.self)
}

struct CustomHorizontalView: View {
    
    var body: some View {
        
        VStack(alignment: .myCustomALignment, spacing: 5) {
            Rectangle()
                .fill(Color.primary)
                .frame(width: 1, height:100)
                .alignmentGuide(.myCustomALignment) { d in d[.leading]}
            Day2(label: "", height: 10)
                .alignmentGuide(HorizontalAlignment.center, computeValue: { dimension in
                    0
//                    -10
                })
            Day2(label: "", height: 20)
            Day2(label: "", height: 30)
            Day2(label: "", height: 40)
            Day2(label: "", height: 30)
            Day2(label: "", height: 20)
            Day2(label: "", height: 10)
            Rectangle()
                .fill(Color.primary)
//                .frame(width: 1, height: 50)
                .frame(width: 20, height: 100)
                .alignmentGuide(.myCustomALignment) { d in d[.trailing]}
        }
        .padding()
        .border(Color.gray)
    }
}

struct Day2: View {
    let label: String
    let height: CGFloat
    
    var body: some View {
        
        Text(label)
            .frame(height: height)
            .frame(width: 50)
            .background(RoundedRectangle(cornerRadius: 5)
                .fill(Color.red.opacity(0.9))
            )
            .foregroundColor(.white)
    }
}

#Preview {
    CustomHorizontalView()
}
