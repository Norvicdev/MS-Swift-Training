//
//  BTMaxPathSumTests.swift
//  Sort_It_Tests
//
//  Created by Alex Jiang on 26/8/21.
//

import XCTest
@testable import Sort_It

final class BTMaxPathSumTests: XCTestCase {
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
    self.helperOne(expected: 30, message: "one")
  }

  private func helperOne(expected: Int,
                         message: String) {
    let result = solution.BTMaxPathSum(tree1)
    XCTAssertEqual(result, expected, message)
  }
}
