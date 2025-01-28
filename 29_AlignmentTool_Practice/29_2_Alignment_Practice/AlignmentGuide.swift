//
//  AlignmentGuide.swift
//  29_2_Alignment_Practice
//
//  Created by Clark Song on 1/27/25.
//

import SwiftUI

struct AlignmentGuide: View {
    var body: some View {
        VStack(alignment: .leading) {
            Rectangle()
                .frame(width: 50, height: 50)
                .alignmentGuide(.leading, computeValue: { dimension in // add this!
                    dimension[.leading]
                })
            Rectangle()
                .frame(width: 50, height: 50)
                .alignmentGuide(.leading, computeValue: { dimension in // add this!
                    dimension[HorizontalAlignment.center]
                })
            Rectangle()
                .frame(width: 50, height: 50)
                .alignmentGuide(.leading, computeValue: { dimension in // add this!
                    dimension[HorizontalAlignment.trailing]
                })
            Rectangle()
                .frame(width: 50, height: 50)
                .alignmentGuide(.leading, computeValue: { dimension in // add this!
                    dimension[HorizontalAlignment.trailing] + 10
                })
            Text("Testing the alignment")
                .frame(width: 200)
                .padding(.vertical)
                .border(.red)
           
            Rectangle()
                .foregroundStyle(.blue)
                .frame(width: 50, height: 50)
            
            Rectangle()
                .foregroundStyle(.blue)
                .frame(width: 25, height: 25)

        }
        .padding()
        .border(.red)
    }
}

#Preview {
    AlignmentGuide()
}
