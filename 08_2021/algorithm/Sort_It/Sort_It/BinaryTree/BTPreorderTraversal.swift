//
//  BTPreorderTraversal.swift
//  Sort_It
//
//  Created by Alex Jiang on 23/8/21.
//

import Foundation

extension Solution {
  // root, left, right
  func preOrderTraversalV1(root: BinaryNode<Int>) -> [Int] {
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

  func preOrderTraversalV2(root: BinaryNode<Int>?) -> [Int] {
    var stack = Stack<BinaryNode<Int>>()
    var result = [Int]()
    guard let _root = root else { return result }

    stack.push(_root)
    while !stack.isEmpty {
      let node = stack.pop()
      result.append(node!.value)
      if node?.rightChild != nil {
        stack.push(node!.rightChild!)
      }
      if node?.leftChild != nil {
        stack.push(node!.leftChild!)
      }
    }

    return result
  }

  func preOrderTraversalV3(root: BinaryNode<Int>?) -> [Int] {
    var result = [Int]()
    guard let _root = root else { return result }

    let left = preOrderTraversalV3(root: _root.leftChild)
    let right = preOrderTraversalV3(root: _root.rightChild)

    result.append(_root.value)
    result.append(contentsOf: left)
    result.append(contentsOf: right)

    return result
  }
}
