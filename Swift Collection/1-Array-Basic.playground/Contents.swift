//  Microsoft Mobile Coaching
//
//  Created by Alex Jiang on 7/3/18.
//  Copyright © 2018 Alex Jiang. All rights reserved.


import Foundation


// MARK : - Init
var array1: Array<Int> = Array<Int>()
var array2: [Int] = []
var array3 = array2


// MARK: - Init Value
var twoInts = [Int](repeating: 2, count: 2)
var fourInts = twoInts + twoInts
var sixInts = [0, 1, 2, 3, 4, 5]


// MARK: - Common Attributes
array2.count
sixInts.count

if array2.isEmpty { debugPrint("true") }


// MARK: - Array Element
sixInts[2]
//sixInts[6] // crash

sixInts[0...2]
sixInts[0..<2]

// +---------+---+
// | length  | 6 |
// +---------+---+
// | storage ptr |
// +---------+---+
//           |
//           v
//           +---+---+---+---+---+------------------------+
//           | 1 | 2 | 3 | 4 | 5 | 6 | reserved capacity  |
//           +---+---+---+---+---+------------------------+
//           ^
//           |
// +---------+---+
// | storage ptr |
// +---------+---+
// | beg idx | 0 |
// +---------+---+
// | end idx | 3 |  ArraySlice for [0...2]
// +---------+---+


// MARK: - Array Looping
for value in sixInts { debugPrint(value) }
for (idx, value) in sixInts.enumerated() { debugPrint("\(idx): \(value)") }
sixInts.forEach { debugPrint($0) }

// MARK: - Array Element
// check the safe idx !
