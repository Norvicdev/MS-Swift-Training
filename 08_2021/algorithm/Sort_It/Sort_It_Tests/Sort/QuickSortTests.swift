//
//  QuickSortTests.swift
//  Sort_It_Tests
//
//  Created by Alex Jiang on 26/8/21.
//

import XCTest
@testable import Sort_It

final class QuickSortTests: XCTestCase {
  let solution = Solution()

  func test1() {
    self.helperOne(expected: [],
                   a: [],
                   message: "empty")
  }

  func test2() {
    self.helperOne(expected: [1, 2],
                   a: [1, 2],
                   message: "one")
  }

  func test3() {
    self.helperOne(expected: [0, 1, 2, 3],
                   a: [3, 2, 1, 0],
                   message: "one")
  }

  func test4() {
    self.helperOne(expected: [-100, 0, 22, 55, 100],
                   a: [0, 100, -100, 22, 55],
                   message: "one")
  }

  func test5() {
    self.helperOne(expected: [-100, -100, 0, 0, 22, 55, 100, 100, 2122],
                   a: [0, 100, -100, 22, 55, 2122, 0, 100, -100],
                   message: "one")
  }

  private func helperOne(expected: [Int],
                         a: [Int],
                         message: String) {
    let result = solution.quickSort(a)
    XCTAssertEqual(result, expected, message)
  }
}
