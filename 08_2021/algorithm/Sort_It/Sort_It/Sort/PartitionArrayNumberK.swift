//
//  PartitionArrayNumberK.swift
//  Sort_It
//
//  Created by Alex Jiang on 26/8/21.
//

import Foundation

//https://aaronice.gitbook.io/lintcode/array/partition_array
//Given an array nums of integers and an int k, partition the array (i.e move the elements in "nums") such that:
//All elements < k are moved to the left
//All elements >= k are moved to the right
//Return the partitioning index, i.e the first index i nums[i] >= k.

extension Solution {
  func partitionArrayNumberK(_ array: inout [Int], num: Int) -> Int {
    guard array.count > 1 else { return 0 }
    guard array.contains(num) else { return -1 }

    var leftIdx = 0
    var rightIdx = array.count - 1

    while leftIdx <= rightIdx {
      while array[leftIdx] < num { leftIdx += 1 }
      while array[rightIdx] >= num { rightIdx -= 1 }

      if leftIdx <= rightIdx {
        array.swapAt(leftIdx, rightIdx)
      }
    }

    return leftIdx
  }
}
