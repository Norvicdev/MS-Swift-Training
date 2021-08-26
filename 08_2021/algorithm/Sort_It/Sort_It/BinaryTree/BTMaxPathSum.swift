//
//  BTMaxPathSum.swift
//  Sort_It
//
//  Created by Alex Jiang on 26/8/21.
//

import Foundation

// given a binary tree, find the max path sum
// the path may start and end at any node in the tree
extension Solution {
  func BTMaxPathSum(_ root: BinaryNode<Int>?) -> Int {
    func helper(_ root: BinaryNode<Int>?) -> (singlePath: Int, maxPath: Int) {
      guard let _root = root else { return (0, Int.min) }

      let left = helper(_root.leftChild)
      let right = helper(_root.rightChild)

      var singlePath = max(left.singlePath, right.singlePath) + _root.value
      singlePath = max(singlePath, 0)

      var maxPath = max(left.maxPath, right.maxPath)
      maxPath = max(maxPath, left.singlePath + right.singlePath + _root.value)

      return (singlePath, maxPath)
    }

    return helper(root).maxPath
  }
}
