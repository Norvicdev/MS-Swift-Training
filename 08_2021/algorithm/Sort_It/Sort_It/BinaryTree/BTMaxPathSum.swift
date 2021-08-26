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
    guard let _root = root else { return 0 }

    let left = BTMaxPathSum(_root.leftChild)
    let right = BTMaxPathSum(_root.rightChild)

    return max(left + _root.value, right + _root.value)
  }
}
