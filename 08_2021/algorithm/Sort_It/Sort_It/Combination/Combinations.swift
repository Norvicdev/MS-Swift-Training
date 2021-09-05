//
//  Combinations.swift
//  Sort_It
//
//  Created by Alex Jiang on 1/9/21.
//

import Foundation

// Given two integers n and k, return all possible combinations of k numbers out of the range [1, n].
// https://leetcode-cn.com/problems/combinations/solution/zu-he-by-leetcode-solution/
extension Solution {
  func combine(_ n: Int, _ k: Int) -> [[Int]] {
    var result = [[Int]]()
    var temp = [Int]()

    func helper(_ cur: Int) {
      if temp.count == k {
        result.append(temp)
      }

      if cur == n + 1 {
        return
      }

      temp.append(cur)
      helper(cur + 1)
      temp.removeLast()
      helper(cur + 1)
    }

    helper(1)

    return result
  }
}
