//
//  SubsetOne.swift
//  Sort_It
//
//  Created by Alex Jiang on 21/8/21.
//

import Foundation

extension Solution {
  func subsetOne(_ nums: [Int]) -> [[Int]] {
    var result = [[Int]]()
    guard nums.count != 0 else { return result }

    let sorted = nums.sorted()
    var subset = [Int]()
    debugPrint(subset)
    subsetsHelper(sorted, 0, &subset, &result)

    return result
  }

  private func subsetsHelper(_ nums: [Int],
                             _ startIndex: Int,
                             _ subset: inout [Int],
                             _ results: inout [[Int]]) {
    // deep copy
    let copy = subset
    results.append(copy)

    for i in 0..<nums.count {
      subset.append(nums[i])
      subsetsHelper(nums, i+1, &subset, &results)
      subset.removeLast()
    }
  }
}
