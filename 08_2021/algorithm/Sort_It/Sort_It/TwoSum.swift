//
//  TwoSum.swift
//  Sort_It
//
//  Created by Alex Jiang on 15/8/21.
//

import Foundation

public func twoSumV1(_ array: [Int], _ target: Int) -> [Int] {
  for i in 0..<array.count {
    let first = array[i]
    for j in i+1..<array.count {
      let second = array[j]

      if first + second == target {
        return [first, second]
      }
    }
  }

  return []
}

public func twoSumV2(_ array: [Int], _ target: Int) -> [Int] {
  let array = array.sorted()

  var leftIdx = 0
  var rightIdx = array.count - 1

  while leftIdx < rightIdx {
    let leftMost = array[leftIdx]
    let rightMost = array[rightIdx]

    let currentSum = leftMost + rightMost

    if currentSum == target {
      return [leftMost, rightMost]
    } else if currentSum < target {
      leftIdx += 1
    } else {
      rightIdx -= 1
    }
  }
  
  return []
}
