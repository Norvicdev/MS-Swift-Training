//
//  PermutationsTwo.swift
//  Sort_It
//
//  Created by Alex Jiang on 6/9/21.
//

import Foundation

// https://leetcode-cn.com/problems/permutations-ii/
// Given a collection of numbers, nums, that might contain duplicates,
// return all possible unique permutations in any order.
extension Solution {
  func permuteUnique(_ nums: [Int]) -> [[Int]] {
    var result = [[Int]]()
    var path = [Int]()

    guard !nums.isEmpty else { return result }

    func helper(_ depth: Int, _ path: inout [Int], _ used: inout [Bool]) {
      if depth == nums.count {
        result.append(path)
        return
      }

      for (index, item) in nums.enumerated() {
        if (index >= 1 && nums[index] == nums[index - 1] && !used[index - 1]) { continue }
        if used[index] { continue }

        path.append(item)
        used[index] = true
        helper(depth + 1, &path, &used)
        path.removeLast()
        used[index] = false
      }
    }

    var used = Array.init(repeating: false, count: nums.count)
    helper(0, &path, &used)

    return result
  }
}
