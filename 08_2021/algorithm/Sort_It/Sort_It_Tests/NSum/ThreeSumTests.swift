//
//  ThreeSumTests.swift
//  Sort_It_Tests
//
//  Created by Alex Jiang on 21/8/21.
//

import XCTest
@testable import Sort_It

final class ThreeSumTests: XCTestCase {
  let solution = Solution()

  func testEmptyInput() {
    let expected = [[Int]]()
    let result = solution.threeNumberSum([], 100)

    XCTAssertEqual(result, expected, "should return empty array")
  }

  func testNoMatch() {
    let expected = [[Int]]()
    let result = solution.threeNumberSum([1, 2, 3, 44, -22], 100)

    XCTAssertEqual(result, expected, "should return empty array")
  }

  func test1() {
    self.helper(expected: [[0, 1, 2,]],
                array: [3, 1, 2, 0, 44],
                sum: 3,
                message: "1 set")
  }

  func test2() {
    self.helper(expected: [[-1, 1, 3], [0, 1, 2]],
                array: [3, 1, 2, 0, 44, -1],
                sum: 3,
                message: "2 sets")
  }

  private func helper(expected: [[Int]],
                      array: [Int],
                      sum: Int,
                      message: String) {
    let result = solution.threeNumberSum(array, sum)
    XCTAssertEqual(result, expected, message)
  }
}
