//
//  Permutations.swift
//  Sort_It
//
//  Created by Alex Jiang on 6/9/21.
//

import Foundation

// https://leetcode-cn.com/problems/permutations/
// Given an array nums of distinct integers, return all the possible permutations.
// You can return the answer in any order.
extension Solution {
  func permute(_ nums: [Int]) -> [[Int]] {
    var result = [[Int]]()
    var temp = [Int]()

    func helper(_ depth: Int, _ path: inout [Int], _ used: inout [Bool]) {
      if depth == nums.count {
        result.append(path)
        return
      }

      for (index, item) in nums.enumerated() {
        if used[index] { continue }

        path.append(item)
        used[index] = true
        helper(depth + 1, &path, &used)
        path.removeLast()
        used[index] = false
      }
    }

    var used = Array.init(repeating: false, count: nums.count)
    helper(0, &temp, &used)

    return result
  }
}
