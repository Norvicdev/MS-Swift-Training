//
//  PartitionArrayNumberKTests.swift
//  Sort_It_Tests
//
//  Created by Alex Jiang on 26/8/21.
//

import XCTest
@testable import Sort_It

final class PartitionArrayNumberKTests: XCTestCase {
  let solution = Solution()

  func test1() {
    self.helperOne(expected: 0,
                   a: [Int](),
                   num: 2,
                   message: "empty")
  }

  func test2() {
    self.helperOne(expected: 2,
                   a: [0, 1, 2, 5],
                   num: 2,
                   message: "one")
  }

  func test3() {
    self.helperOne(expected: 2,
                   a: [0, 1, 1, -1],
                   num: 1,
                   message: "one")
  }

  func test4() {
    self.helperOne(expected: 2,
                   a: [20, 20, -10, 0, 10],
                   num: 10,
                   message: "one")
  }

  func test5() {
    self.helperOne(expected: 2,
                   a: [20, 20, -10, 0, 10, 10],
                   num: 10,
                   message: "one")
  }

  private func helperOne(expected: Int,
                         a: [Int],
                         num: Int,
                         message: String) {
    var array = a
    let result = solution.partitionArrayNumberK(&array, num: num)
    XCTAssertEqual(result, expected, message)
  }
}
