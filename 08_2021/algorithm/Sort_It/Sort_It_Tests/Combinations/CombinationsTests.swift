//
//  CombinationsTests.swift
//  Sort_It_Tests
//
//  Created by Alex Jiang on 5/9/21.
//

import XCTest
@testable import Sort_It

final class CombinationsTests: XCTestCase {
  let solution = Solution()

  func test1() {
    self.helper(expected: [[1]],
                n: 1,
                k: 1,
                message: "1")
  }

  func test2() {
    self.helper(expected: [
                  [1, 2],
                  [1, 3],
                  [1, 4],
                  [2, 3],
                  [2, 4],
                  [3, 4]
    ],
                n: 4,
                k: 2,
                message: "4, 2")
  }

  private func helper(expected: [[Int]],
                      n: Int,
                      k: Int,
                      message: String) {
    let result = solution.combine(n, k)
    XCTAssertEqual(result, expected, message)
  }
}
