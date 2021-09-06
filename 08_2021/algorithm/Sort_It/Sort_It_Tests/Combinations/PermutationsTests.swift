//
//  PermutationsTests.swift
//  Sort_It_Tests
//
//  Created by Alex Jiang on 6/9/21.
//

import XCTest
@testable import Sort_It

final class PermutationsTests: XCTestCase {
  let solution = Solution()

  func test1() {
    self.helper(expected: [[1]], nums: [1], message: "1")
  }

  func test2() {
    self.helper(expected: [[0,1], [1,0]], nums: [0, 1], message: "2")
  }

  func test3() {
    self.helper(expected: [[1,2,3],
                           [1,3,2],
                           [2,1,3],
                           [2,3,1],
                           [3,1,2],
                           [3,2,1]
    ],
                nums: [1, 2, 3],
                message: "3")
  }

  private func helper(expected: [[Int]],
                      nums: [Int],
                      message: String) {
    let result = solution.permute(nums)
    XCTAssertEqual(result, expected, message)
  }
}
