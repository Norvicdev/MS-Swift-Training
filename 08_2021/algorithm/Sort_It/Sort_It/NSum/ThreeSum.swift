//
//  ThreeSum.swift
//  Sort_It
//
//  Created by Alex Jiang on 21/8/21.
//

import Foundation

extension Solution {
  func threeNumberSum(_ array: [Int], _ targetSum: Int) -> [[Int]] {
    var result = [[Int]]()
    guard array.count >= 3 else { return result }
    let array = array.sorted()

    for i in 0..<array.count - 2 {
      var left = i + 1
      var right = array.count - 1

      while left < right {
        let sum = array[left] + array[i] + array[right]
        if sum == targetSum {
          result.append([array[i], array[left], array[right]])
          left += 1
          right -= 1
        } else if sum < targetSum {
          left += 1
        } else {
          right -= 1
        }
      }
    }

    return result
  }
}
