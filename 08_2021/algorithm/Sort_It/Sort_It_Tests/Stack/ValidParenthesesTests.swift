//
//  ValidParenthesesTests.swift
//  Sort_It_Tests
//
//  Created by Alex Jiang on 12/9/21.
//

import Foundation

import XCTest
@testable import Sort_It

final class ValidParenthesesTests: XCTestCase {
  let solution = Solution()

  func test1() {
    self.helper(expected: true, s: "", message: "empty")
  }

  func test2() {
    self.helper(expected: true, s: "(((())))", message: "(((())))")
  }

  func test3() {
    self.helper(expected: false, s: "]]((", message: "]]((")
  }

  func test4() {
    self.helper(expected: false, s: "([)]", message: "([)]")
  }

  private func helper(expected: Bool,
                      s: String,
                      message: String) {
    let result = solution.validParentheses(s)
    XCTAssertEqual(result, expected, message)
  }
}
