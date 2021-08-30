//
//  BTMinDepth.swift
//  Sort_It
//
//  Created by Alex Jiang on 30/8/21.
//

import Foundation

// https://leetcode.com/problems/minimum-depth-of-binary-tree/
extension Solution {
  func minDepth(_ root: BinaryNode<Int>?) -> Int {
    guard let _root = root else { return 0 }

    let left = minDepth(_root.leftChild)
    let right = minDepth(_root.rightChild)

    return min(left, right) + 1
  }
}
