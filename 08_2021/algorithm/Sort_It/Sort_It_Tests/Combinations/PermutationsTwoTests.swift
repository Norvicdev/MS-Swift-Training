//
//  PermutationsTwoTests.swift
//  Sort_It_Tests
//
//  Created by Alex Jiang on 7/9/21.
//

import XCTest
@testable import Sort_It

final class PermutationsTwoTests: XCTestCase {
  let solution = Solution()

  func test1() {
    self.helper(expected: [[1]], nums: [1], message: "1")
  }

  func test2() {
    self.helper(expected: [[1, 1]], nums: [1, 1], message: "1, 1")
  }

  func test3() {
    self.helper(expected: [[1,1,2],
                           [1,2,1],
                           [2,1,1]],
                nums: [1,1,2],
                message: "1, 1, 2")
  }

  private func helper(expected: [[Int]],
                      nums: [Int],
                      message: String) {
    let result = solution.permuteUnique(nums)
    XCTAssertEqual(result, expected, message)
  }
}
