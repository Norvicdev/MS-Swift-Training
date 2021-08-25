//
//  MergeSorting.swift
//  Sort_It
//
//  Created by Alex Jiang on 25/8/21.
//

import Foundation

extension Solution {
  func mergeSort(_ array: [Int]) -> [Int] {
    guard array.count > 1 else { return array }

    let mid = array.count / 2
    let left = mergeSort(Array(array[0..<mid]))
    let right = mergeSort(Array(array[mid...]))

    return mergeTwoSortedArray(left, right)
  }

  func mergeTwoSortedArray(_ a: [Int], _ b: [Int]) -> [Int] {
    var result = [Int]()

    var i = 0
    var j = 0

    while i < a.count && j < b.count {
      if a[i] < b[j] {
        result.append(a[i])
        i += 1
      } else if a[i] > b[j] {
        result.append(b[j])
        j += 1
      } else {
        result.append(a[i])
        result.append(b[j])
        i += 1
        j += 1
      }
    }

    if i < a.count {
      result.append(contentsOf: a[i...])
    }

    if j < b.count {
      result.append(contentsOf: a[j...])
    }

    return result
  }
}
