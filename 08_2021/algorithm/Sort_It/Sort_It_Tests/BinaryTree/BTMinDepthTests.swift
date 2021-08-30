//
//  BTMinDepthTests.swift
//  Sort_It_Tests
//
//  Created by Alex Jiang on 30/8/21.
//

import XCTest
@testable import Sort_It

final class BTMinDepthTests: XCTestCase {
  let solution = Solution()

  var tree1: BinaryNode<Int> = {
    let zero = BinaryNode(value: 0)
    let one = BinaryNode(value: 1)
    let five = BinaryNode(value: 5)
    let seven = BinaryNode(value: 7)
    let eight = BinaryNode(value: 8)
    let nine = BinaryNode(value: 9)

    seven.leftChild = one
    one.leftChild = zero
    one.rightChild = five
    seven.rightChild = nine
    nine.leftChild = eight

    return seven
  }()

  func test1() {
    debugPrint(tree1)
    self.helperOne(expected: 3, message: "3")
  }

  private func helperOne(expected: Int,
                         message: String) {
    let result = solution.minDepth(self.tree1)
    XCTAssertEqual(result, expected, message)
  }
}
