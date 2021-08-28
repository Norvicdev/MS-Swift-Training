//
//  ClimbStairsTests.swift
//  Sort_It_Tests
//
//  Created by Alex Jiang on 28/8/21.
//

import XCTest
@testable import Sort_It

final class ClimbStairsTests: XCTestCase {
  let solution = Solution()

  func test1() {
    self.helper(expected: 1, n: 1, message: "1")
  }

  func test2() {
    self.helper(expected: 3, n: 3, message: "3")
  }

  func test3() {
    self.helper(expected: 5, n: 4, message: "5")
  }

  func test4() {
    self.helper(expected: 8, n: 5, message: "5")
  }

  private func helper(expected: Int,
                      n: Int,
                      message: String) {
    let result = solution.climbStairs(n)
    XCTAssertEqual(result, expected, message)
  }
}
