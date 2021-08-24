//
//  BTBalancedTree.swift
//  Sort_It
//
//  Created by Alex Jiang on 24/8/21.
//

import Foundation

extension Solution {
  // https://leetcode.com/problems/balanced-binary-tree/
  // the whole balanced = left tree balanced + right tree balanced
  func BTbalancedTree(root: BinaryNode<Int>?) -> Bool {
    // return -1 when it's not balanced
    func maxDepth(root: BinaryNode<Int>?) -> Int {
      guard let _root = root else { return 0 }

      let left = maxDepth(root: _root.leftChild)
      let right = maxDepth(root: _root.rightChild)
      if (left == -1 || right == -1 || abs(left - right) > 1) {
        return -1
      }

      return max(left, right) + 1
    }

    return maxDepth(root: root) != -1
  }
}
