//
//  QuickSorting.swift
//  Sort_It
//
//  Created by Alex Jiang on 26/8/21.
//

import Foundation

extension Solution {
  func quickSort(_ array: [Int]) -> [Int] {
    guard array.count > 1 else { return array }

    let pivot = array[array.count / 2]
    let smaller = array.filter { $0 < pivot }
    let equal = array.filter { $0 == pivot }
    let larger = array.filter { $0 > pivot }

    return quickSort(smaller) + equal + quickSort(larger)
  }
}
