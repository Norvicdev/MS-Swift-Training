//
//  NextPermutationTests.swift
//  Sort_It_Tests
//
//  Created by Alex Jiang on 8/9/21.
//

import XCTest
@testable import Sort_It

final class NextPermutationTests: XCTestCase {
  let solution = Solution()

  func test1() {
    var nums = [1]
    self.helper(expected: [1], nums: &nums, message: "1")
  }

  func test2() {
    var nums = [1, 2, 3]
    self.helper(expected: [1, 3, 2], nums: &nums, message: "1, 2, 3")
  }

  func test3() {
    var nums = [1, 1, 5]
    self.helper(expected: [1, 5, 1], nums: &nums, message: "1, 1, 5")
  }

  func test4() {
    var nums = [4, 5, 2, 6, 3, 1]
    self.helper(expected: [4, 5, 3, 1, 2, 6], nums: &nums, message: "4, 5, 2, 6, 3, 1")
  }

  private func helper(expected: [Int],
                      nums: inout [Int],
                      message: String) {
    solution.nextPermutation(&nums)
    XCTAssertEqual(nums, expected, message)
  }
}
