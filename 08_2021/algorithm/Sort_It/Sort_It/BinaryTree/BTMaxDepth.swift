//
//  BTMaxDepth.swift
//  Sort_It
//
//  Created by Alex Jiang on 24/8/21.
//

import Foundation

extension Solution {
  // Divide & Conquer
  func BTMaxDepth(root: BinaryNode<Int>?) -> Int {
    guard let _root = root else { return 0 }

    let left = BTMaxDepth(root: _root.leftChild)
    let right = BTMaxDepth(root: _root.rightChild)

    return max(left, right) + 1
  }
}
