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

  // 如果我们枚举「高」，我们可以使用一重循环枚举某一根柱子，将其固定为矩形的高度 h.
  // 随后我们从这跟柱子开始向两侧延伸，直到遇到高度小于 h 的柱子，就确定了矩形的左右边界.
  func largestRectangleAreaV2(_ heights: [Int]) -> Int {
    guard !heights.isEmpty else { return 0 }

    var result = Int.min
    let n = heights.count

    for (index, height) in heights.enumerated() {
      var left = index
      var right = index

      while (left - 1 > 0 && heights[left - 1] > height) {
        left -= 1
      }
      while (right + 1 < n && heights[right + 1] > height) {
        right += 1
      }

      let area = height * (right - left + 1)
      result = max(result, area)
    }

    return result
  }
}
