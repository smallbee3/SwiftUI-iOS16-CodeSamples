//
//  CustomView2.swift
//  29_2_Alignment_Practice
//
//  Created by Clark Song on 1/27/25.
//

import SwiftUI

extension HorizontalAlignment {
    private enum WeirdAlignment: AlignmentID {
        static func defaultValue(in d: ViewDimensions) -> CGFloat {
            return d.height
        }
    }
    
    static let weirdAlignment = HorizontalAlignment(WeirdAlignment.self)
}

struct CustomHorizontalView2: View {
    var body: some View {
        VStack(alignment: .weirdAlignment, spacing: 10) {
            
            Rectangle()
                .fill(Color.primary)
                .frame(width: 1)
                .alignmentGuide(.weirdAlignment, computeValue: { d in d[.leading] })
            
            ColorLabel(label: "Monday", color: .red, height: 50)
            ColorLabel(label: "Tuesday", color: .orange, height: 70)
            ColorLabel(label: "Wednesday", color: .yellow, height: 90)
            ColorLabel(label: "Thursday", color: .green, height: 40)
            ColorLabel(label: "Friday", color: .blue, height: 70)
            ColorLabel(label: "Saturday", color: .purple, height: 40)
            ColorLabel(label: "Sunday", color: .pink, height: 40)
            
            Rectangle()
                .fill(Color.primary)
                .frame(width: 1)
                .alignmentGuide(.weirdAlignment, computeValue: { d in d[.leading] })
        }
    }
}

struct ColorLabel: View {
    let label: String
    let color: Color
    let height: CGFloat
    
    var body: some View {
        Text(label).font(.title).foregroundColor(.primary).frame(height: height).padding(.horizontal, 20)
            .background(RoundedRectangle(cornerRadius: 8).fill(color))
    }
}

#Preview {
    CustomHorizontalView2()
}
