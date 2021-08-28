//
//  ValidBSTTests.swift
//  Sort_It_Tests
//
//  Created by Alex Jiang on 28/8/21.
//

import XCTest
@testable import Sort_It

final class ValidBSTTests: XCTestCase {
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
    self.helperOne(expected: true, message: "true")
  }

  private func helperOne(expected: Bool,
                         message: String) {
    let result = solution.isValidBST(tree1)
    XCTAssertEqual(result, expected, message)
  }
}
