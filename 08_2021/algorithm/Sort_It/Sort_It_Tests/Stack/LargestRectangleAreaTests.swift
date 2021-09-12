//
//  LargestRectangleAreaTests.swift
//  Sort_It_Tests
//
//  Created by Alex Jiang on 12/9/21.
//

import Foundation

import XCTest
@testable import Sort_It

final class LargestRectangleAreaTests: XCTestCase {
  let solution = Solution()

  func test1() {
    self.helperV1(expected: 2, heights: [2], message: "[2]")
  }

  func test2() {
    self.helperV1(expected: 10, heights: [2,1,5,6,2,3], message: "[2,1,5,6,2,3]")
  }

  func test3() {
    self.helperV1(expected: 4, heights: [2, 4], message: "[2, 4]")
  }

  private func helperV1(expected: Int,
                        heights: [Int],
                        message: String) {
    let result = solution.largestRectangleAreaV1(heights)
    XCTAssertEqual(result, expected, message)
  }
}
