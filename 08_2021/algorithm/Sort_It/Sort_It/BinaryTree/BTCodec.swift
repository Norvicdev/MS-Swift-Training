//
//  BTCodec.swift
//  Sort_It
//
//  Created by Alex Jiang on 30/8/21.
//

import Foundation

extension Solution {
  func serialize(_ root: BinaryNode<Int>?) -> String {
    var result = ""

    func preorder(_ root: BinaryNode<Int>?) {
      guard let _root = root else { result += "None,"; return }
      result += "\(_root.value),"
      preorder(_root.leftChild)
      preorder(_root.rightChild)
    }
    preorder(root)

    return result
  }

  func deserialize(_ data: String) -> BinaryNode<Int>? {
    var result = data.split(separator: ",")

    func preorder(_ data: inout [String.SubSequence]) -> BinaryNode<Int>? {
      guard data.first! != "None" else {
        data.removeFirst()
        return nil
      }

      let node = BinaryNode(value: Int(data.first!)!)
      data.removeFirst()
      node.leftChild = preorder(&data)
      node.rightChild = preorder(&data)

      return node
    }

    return preorder(&result)
  }
}
