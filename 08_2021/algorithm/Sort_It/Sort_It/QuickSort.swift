//
//  QuickSort.swift
//  Sort_It
//
//  Created by Alex Jiang on 14/8/21.
//

import Foundation

public func quickSortNaive<E: Comparable>(_ a: [E]) -> [E] {
  guard a.count > 1 else { return a }

  let pivot = a[a.count / 2]
  let less = a.filter { $0 < pivot }
  let equal = a.filter { $0 == pivot }
  let greater = a.filter { $0 > pivot }

  return quickSortNaive(quickSortNaive(less) + equal + quickSortNaive(greater))
}
