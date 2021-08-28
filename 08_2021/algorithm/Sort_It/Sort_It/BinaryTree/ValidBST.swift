//
//  ValidBST.swift
//  Sort_It
//
//  Created by Alex Jiang on 28/8/21.
//

import Foundation

// https://leetcode.com/problems/validate-binary-search-tree/
extension Solution {
  func isValidBST(_ root: BinaryNode<Int>?) -> Bool {
    guard let _root = root else { return true }

    if let leftValue = _root.leftChild?.value, leftValue > _root.value {
      return false
    }
    if let rightValue = _root.rightChild?.value, rightValue < _root.value {
      return false
    }

    return isValidBST(_root.leftChild) && isValidBST(_root.rightChild)
  }
}
