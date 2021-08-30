//
//  BTCodecTests.swift
//  Sort_It_Tests
//
//  Created by Alex Jiang on 30/8/21.
//

import XCTest
@testable import Sort_It

final class BTCodecTests: XCTestCase {
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
    self.helperOne(expected: "7,1,0,None,None,5,None,None,9,8,None,None,None,",
                   message: "root 7")
  }

  func test2() {
    self.helperTwo(expected: self.tree1, message: "tree1")
  }

  private func helperOne(expected: String,
                         message: String) {
    let result = solution.serialize(self.tree1)
    XCTAssertEqual(result, expected, message)
  }

  private func helperTwo(expected: BinaryNode<Int>?,
                         message: String) {
    let result = solution.deserialize(solution.serialize(tree1))
    XCTAssertEqual(result?.value, expected?.value, message)
  }
}
