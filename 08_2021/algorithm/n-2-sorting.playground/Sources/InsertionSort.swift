import Foundation

public func insertionSort<E>(_ array: inout [E]) where E:Comparable {
  guard array.count >= 2 else { return }

  for currentIdx in 1..<array.count {
    for endIdx in (1..<currentIdx).reversed() {
      if array[endIdx] < array[endIdx - 1] {
        array.swapAt(endIdx, endIdx - 1)
      } else {
        break
      }
    }
  }
}
