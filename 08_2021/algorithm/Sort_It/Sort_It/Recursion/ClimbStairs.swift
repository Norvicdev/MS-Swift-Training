//
//  ClimbStairs.swift
//  Sort_It
//
//  Created by Alex Jiang on 28/8/21.
//

import Foundation

// https://leetcode.com/problems/climbing-stairs/
extension Solution {
  func climbStairs(_ n: Int) -> Int {
    guard n > 0 else { return 0 }
    if n == 1 { return 1 }
    if n == 2 { return 2 }

    return climbStairs(n - 1) + 1
  }
}
