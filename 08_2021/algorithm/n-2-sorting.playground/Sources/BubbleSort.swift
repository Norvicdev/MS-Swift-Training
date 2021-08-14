import Foundation

public func bubbleSort<E>(_ array: inout [E]) where E: Comparable {
  guard array.count >= 2 else { return }

  for endIdx in (0..<array.count).reversed() {
    var swapped = false
    for currentIdx in 0..<endIdx {
      if array[currentIdx] > array[currentIdx + 1] {
        array.swapAt(currentIdx, currentIdx+1)
        swapped = true
      }
    }

    if !swapped { return }
  }
}
