import Foundation

public func selectionSort<E>(_ array: inout [E]) where E:Comparable {
  guard array.count >= 2 else { return }

  for currentIdx in 0..<(array.count-1) {
    var lowestIdx = currentIdx
    for nextIdx in currentIdx..<array.count {
      if array[lowestIdx] > array[nextIdx] {
        lowestIdx = nextIdx
      }
    }

    if lowestIdx != currentIdx {
      array.swapAt(currentIdx, lowestIdx)
    }
  }
}
