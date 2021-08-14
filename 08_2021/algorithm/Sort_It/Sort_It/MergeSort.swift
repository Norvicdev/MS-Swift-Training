//
//  MergeSort.swift
//  Sort_It
//
//  Created by Alex Jiang on 14/8/21.
//

import Foundation

public func mergeSort<E>(_ array:[E]) -> [E] where E:Comparable {
  guard array.count > 1 else { return array }

  let mid = array.count / 2
  let left = mergeSort(Array(array[..<mid]))
  let right = mergeSort(Array(array[mid...]))
  return merge(left, right)
}

func merge<E>(_ left: [E], _ right: [E]) -> [E] where E:Comparable {
  var leftIdx = 0
  var rightIdx = 0
  var result: [E] = []

  while leftIdx < left.count && rightIdx < right.count {
    let leftValue = left[leftIdx]
    let rightValue = right[rightIdx]

    if leftValue < rightValue {
      result.append(leftValue)
      leftIdx += 1
    } else if leftValue > rightValue {
      result.append(rightValue)
      rightIdx += 1
    } else {
      result.append(leftValue)
      result.append(rightValue)
      leftIdx += 1
      rightIdx += 1
    }
  }

  if leftIdx < left.count {
    result.append(contentsOf: left[leftIdx...])
  }
  if rightIdx < right.count {
    result.append(contentsOf: right[rightIdx...])
  }

  return result
}
