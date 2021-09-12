//
//  LargestRectangleArea.swift
//  Sort_It
//
//  Created by Alex Jiang on 12/9/21.
//

import Foundation

// https://leetcode-cn.com/problems/largest-rectangle-in-histogram/
extension Solution {
  func largestRectangleAreaV1(_ heights: [Int]) -> Int {
    guard !heights.isEmpty else { return 0 }

    var result = Int.min
    let n = heights.count

    for left in 0..<n {
      var minValue = Int.max
      for right in left..<n {
        minValue = min(minValue, heights[right])
        let area = minValue * (right - left + 1)
        result = max(result, area)
      }
    }

    return result
  }
}
