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

  func test4Point1() {
    self.helperOne(expected: [-100, 1, 1000],
                   a: [-100],
                   b: [1, 1000],
                   message: "two arrays")
  }

  func test5() {
    self.helperTwo(expected: [-100, 0, 1, 2, 100, 1000],
                   a: [-100, 1000, 1, 0, 100, 2],
                   message: "random")
  }

  func test6() {
    self.helperTwo(expected: [],
                   a: [],
                   message: "empty")
  }

  func test7() {
    self.helperTwo(expected: [-555, -222, 222, 444, 1213],
                   a: [1213, 444, 222, -222, -555],
                   message: "reverse")
  }

  private func helperOne(expected: [Int],
                      a: [Int],
                      b: [Int],
                      message: String) {
    let result = solution.mergeTwoSortedArray(a, b)
    XCTAssertEqual(result, expected, message)
  }

  private func helperTwo(expected: [Int],
                         a: [Int],
                         message: String) {
    let result = solution.mergeSort(a)
    XCTAssertEqual(result, expected, message)
  }
}
