//
//  AlignmentGuide.swift
//  29_2_Alignment_Practice
//
//  Created by Clark Song on 1/27/25.
//

import SwiftUI

extension VerticalAlignment {
  private enum OneThird: AlignmentID {
    static func defaultValue(in d: ViewDimensions) -> CGFloat {
      return d.height / 3
//        return 30
    }
  }
  static let oneThird = VerticalAlignment(OneThird.self)
}

struct AlignmentGuide2: View {
    var body: some View {
//        HStack(alignment: .center) {
        HStack(alignment: .oneThird) {
          Rectangle()
            .foregroundColor(Color.green)
            .frame(width: 50, height: 200)
          Rectangle()
            .foregroundColor(Color.red)
            .frame(width: 50, height: 200)
            .alignmentGuide(.oneThird,
                            computeValue: { d in d[VerticalAlignment.bottom] + 50 })
          Rectangle()
            .foregroundColor(Color.blue)
            .frame(width: 50, height: 200)
          Rectangle()
            .foregroundColor(Color.orange)
            .frame(width: 50, height: 200)
            .alignmentGuide(.oneThird,
                            computeValue: { d in d[VerticalAlignment.top] + 50 })
        }
        .frame(maxWidth: .infinity) // Ensure horizontal space
    }
}

#Preview {
    AlignmentGuide2()
}
