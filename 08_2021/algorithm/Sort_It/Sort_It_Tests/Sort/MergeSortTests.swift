//
//  MergeSortTests.swift
//  Sort_It_Tests
//
//  Created by Alex Jiang on 25/8/21.
//

import XCTest
@testable import Sort_It

final class MergeSortTests: XCTestCase {
  let solution = Solution()

  func test1() {
    self.helperOne(expected: [],
                   a: [],
                   b: [],
                   message: "empty array")
  }

  func test2() {
    self.helperOne(expected: [1, 2, 3],
                   a: [1, 2, 3],
                   b: [],
                   message: "empty array")
  }

  func test3() {
    self.helperOne(expected: [1, 1, 2, 2, 3, 3],
                   a: [1, 2, 3],
                   b: [1, 2, 3],
                   message: "same array")
  }

  func test4() {
    self.helperOne(expected: [-100, 0, 1, 100, 1000, ],
                   a: [-100, 1000],
                   b: [0, 1, 100],
                   message: "two arrays")
  }

  private func helperOne(expected: [Int],
                      a: [Int],
                      b: [Int],
                      message: String) {
    let result = solution.mergeTwoSortedArray(a, b)
    XCTAssertEqual(result, expected, message)
  }
}
