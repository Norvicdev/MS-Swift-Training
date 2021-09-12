//
//  ValidParentheses.swift
//  Sort_It
//
//  Created by Alex Jiang on 12/9/21.
//

import Foundation

// https://leetcode-cn.com/problems/valid-parentheses/
extension Solution {
  func validParentheses(_ s: String) -> Bool {
    guard !s.isEmpty else { return true }

    var stack = Stack<Character>()
    for (_, char) in s.enumerated() {
      if char == "(" || char == "{" || char == "[" {
        stack.push(char)
      }

      guard let _last = stack.peek() else { return false }
      if char == ")" && _last != "(" {
        return false
      }
      if char == "]" && _last != "[" {
        return false
      }
      if char == "}" && _last != "{" {
        return false
      }
    }

    if !stack.isEmpty { return false }

    return true
  }
}
