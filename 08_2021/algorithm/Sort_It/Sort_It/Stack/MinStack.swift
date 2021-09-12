//
//  MinStack.swift
//  Sort_It
//
//  Created by Alex Jiang on 12/9/21.
//

import Foundation

// https://leetcode-cn.com/problems/min-stack/
// Design a stack that supports push, pop, top, and retrieving the minimum element in constant time.
// 使得每个元素 a 与其相应的最小值 m 时刻保持一一对应。因此我们可以使用一个辅助栈，
// 与元素栈同步插入与删除，用于存储与每个元素对应的最小值。
public struct MinStack<Element: FixedWidthInteger> {
  private var storage: [Element] = []
  private var minStorage: [Element] = [Element.max]

  public init() { }

  public init(_ elements: [Element]) {
    storage = elements
    minStorage = [Element.max]
  }

  public mutating func push(_ element: Element) {
    storage.append(element)
    minStorage.append(min(element, minStorage.last!))
  }

  @discardableResult
  public mutating func pop() -> Element? {
    _ = minStorage.popLast()
    return storage.popLast()
  }

  public func peek() -> Element? {
    return storage.last
  }

  public func getMin() -> Element? {
    return minStorage.last
  }

  public var isEmpty: Bool {
    return peek() == nil
  }
}

extension MinStack: CustomStringConvertible {
  public var description: String {
    let topDivider = "----top----\n"
    let bottomDivider = "\n-----------"

    let stackElements = storage
      .map { "\($0)" }
      .reversed()
      .joined(separator: "\n")
    return topDivider + stackElements + bottomDivider
  }
}

extension MinStack: ExpressibleByArrayLiteral {
  public init(arrayLiteral elements: Element...) {
    storage = elements
  }
}
