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

    func helper(_ cur: Int) {
      if temp.count == nums.count {
        result.append(temp)
        return
      }

      if cur == nums.count {
        return
      }

      temp.append(nums[cur])
      helper(cur + 1)
      temp.removeLast()
      helper(cur + 1)
    }

    return result
  }
}
