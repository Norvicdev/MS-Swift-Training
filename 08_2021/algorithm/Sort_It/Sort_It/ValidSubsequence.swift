//
//  ValidSubsequence.swift
//  Sort_It
//
//  Created by Alex Jiang on 16/8/21.
//

import Foundation

// https://leetcode.com/problems/is-subsequence/

public func isSubsequence(_ s: String, _ t: String) -> Bool {
  guard s.count <= t.count else { return false }
  guard !s.isEmpty, !t.isEmpty else { return false }

  var i = 0
  var j = 0
  var sIdx = s.index(s.startIndex, offsetBy: i)
  var tIdx = t.index(t.startIndex, offsetBy: j)

  while i < s.count, j < t.count {
    if s[sIdx] == t[tIdx] {
      i += 1
      sIdx = s.index(s.startIndex, offsetBy: i)
    } else {
      j += 1
      tIdx = t.index(t.startIndex, offsetBy: j)
    }
  }

  return i == s.count
}
