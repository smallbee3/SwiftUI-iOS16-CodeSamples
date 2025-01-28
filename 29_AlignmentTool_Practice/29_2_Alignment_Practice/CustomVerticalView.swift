//
//  CustomVerticalView.swift
//  29_2_Alignment_Practice
//
//  Created by Clark Song on 1/27/25.
//

import SwiftUI

extension VerticalAlignment {
    private enum MyAlignment : AlignmentID {
        static func defaultValue(in d: ViewDimensions) -> CGFloat {
            return d[.bottom]
        }
    }
    static let myAlignment = VerticalAlignment(MyAlignment.self)
}

struct CustomVerticalView: View {
    @State private var selectedIdx = 1

    let days = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
    let colors = ["red", "orange", "yellow", "green", "blue", "purple", "pink"]
    
    var body: some View {
            HStack(alignment: .myAlignment) {
                Image(systemName: "arrow.right.circle.fill")
                    .alignmentGuide(.myAlignment, computeValue: { d in d[VerticalAlignment.bottom] })
                    .foregroundColor(.green)

                VStack(alignment: .leading) {
                    ForEach(colors.indices, id: \.self) { idx in
                        Group {
                            if idx == self.selectedIdx {
                                Text("")
                                    .frame(width: 100, height: 100)
                                    .background(RoundedRectangle(cornerRadius: 5)
                                        .fill(Color.red.opacity(0.9))
//                                        .fill(Color.colors[idx].opacity(0.9))
                                    )
                                    .transition(AnyTransition.identity)
                                    .alignmentGuide(.myAlignment, computeValue: { d in d[VerticalAlignment.bottom] })
                            } else {
                                Text("")
                                    .frame(width: 100, height: 100)
                                    .background(RoundedRectangle(cornerRadius: 5)
                                        .fill(Color.blue.opacity(0.9))
                                    )
                                    .transition(AnyTransition.identity)
                                    .onTapGesture {
                                        withAnimation {
                                            self.selectedIdx = idx
                                        }
                                }
                            }
                        }
                    }
                }
            }
            .padding(20)
            .font(.largeTitle)
    }
}

#Preview {
    CustomVerticalView()
}
