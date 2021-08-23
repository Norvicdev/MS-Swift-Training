//
//  BTPreorderTraversal.swift
//  Sort_It
//
//  Created by Alex Jiang on 23/8/21.
//

import Foundation

extension Solution {
  // root, left, right
  func preOrderTraversal(root: BinaryNode<Int>) -> [Int] {
    // put preorder traversal into result, starting at root
    func traverse(root: BinaryNode<Int>?,  result: inout [Int]) {
      guard let _root = root else { return }

      result.append(_root.value)
      traverse(root: _root.leftChild, result: &result)
      traverse(root: _root.rightChild, result: &result)
    }

    var result = [Int]()
    traverse(root: root, result: &result)
    return result
  }
}
