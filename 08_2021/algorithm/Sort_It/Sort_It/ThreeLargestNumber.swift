//
//  ThreeLargestNumber.swift
//  Sort_It
//
//  Created by Alex Jiang on 17/8/21.
//

import Foundation

public func threeLargestNumber(_ array: [Int]) -> [Int] {
  guard array.count > 3 else { return array }

  var max1 = Int.min
  var max2 = Int.min
  var max3 = Int.min

  for x in array where x > max1 {
    max1 = x
  }

  for x in array where x != max1 && x > max2 {
    max2 = x
  }

  for x in array where x != max1 && x != max2 && x > max3 {
    max3 = x
  }

  return [max1, max2, max3]
}
