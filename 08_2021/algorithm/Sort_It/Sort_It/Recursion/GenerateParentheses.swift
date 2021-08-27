//
//  GenerateParentheses.swift
//  Sort_It
//
//  Created by Alex Jiang on 27/8/21.
//

import Foundation

// https://leetcode.com/problems/generate-parentheses/
extension Solution {
  func generateParentheses(_ n: Int) -> [String] {
    var result = [String]()

    func helper(_ left: Int, _ right: Int, _ n: Int, _ s: String) {
      if left == n && right == n {
        result.append(s)
        return
      }

      if left < n {
        helper(left + 1, right, n, s + "(")
      }
      if left > right {
        helper(left, right + 1, n, s + ")")
      }
    }

    helper(0, 0, n, "")

    return result
  }

  private func example(_ n: Int) -> [String] {
    var result = [String]()

    func _generate(_ level: Int, _ max: Int, _ s: String) {
      // terminator
      if level > max {
        debugPrint(s)
        result.append(s)
        return
      }

      // process
      let s1 = s + "("
      let s2 = s + ")"

      // drill down
      _generate(level + 1, max, s1)
      _generate(level + 1, max, s2)

      // reverse
    }

    _generate(0, 2 * n, "")

    return result
  }
}
