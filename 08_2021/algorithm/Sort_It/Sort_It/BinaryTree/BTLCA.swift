//
//  BTLCA.swift
//  Sort_It
//
//  Created by Alex Jiang on 9/9/21.
//

import Foundation

// https://leetcode-cn.com/problems/lowest-common-ancestor-of-a-binary-tree/
// https://leetcode-cn.com/problems/lowest-common-ancestor-of-a-binary-tree/solution/c-jing-dian-di-gui-si-lu-fei-chang-hao-li-jie-shi-/
// 最近公共祖先的定义： 设节点 root 为节点 p, q 的某公共祖先，
// 若其左子节点 root.left 和右子节点 root.right 都不是 p,q 的公共祖先，
// 则称 root 是 “最近的公共祖先” 
extension Solution {
  func lowestCommonAncestor(_ root: BinaryNode<Int>?,
                            _ p: BinaryNode<Int>?,
                            _ q: BinaryNode<Int>?)
  -> BinaryNode<Int>? {
    guard let _root = root else { return nil }
    if root?.value == p?.value || root?.value == q?.value { return root }

    let left = lowestCommonAncestor(_root.leftChild, p, q)
    let right = lowestCommonAncestor(_root.rightChild, p, q)

    if left == nil {
      return right
    }
    if right == nil {
      return left
    }
    if left != nil && right != nil {
      return root
    }
    
    return nil
  }
}
