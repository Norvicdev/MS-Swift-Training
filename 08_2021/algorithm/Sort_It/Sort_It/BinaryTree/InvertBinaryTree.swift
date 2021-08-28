//
//  InvertBinaryTree.swift
//  Sort_It
//
//  Created by Alex Jiang on 28/8/21.
//

import Foundation

// https://leetcode.com/problems/invert-binary-tree/
extension Solution {
  func invertTree(_ root: BinaryNode<Int>?) -> BinaryNode<Int>? {
    guard let _root = root else { return nil }

    swap(&_root.leftChild, &_root.rightChild)
    _ = invertTree(_root.leftChild)
    _ = invertTree(_root.rightChild)

    return _root
  }
}
