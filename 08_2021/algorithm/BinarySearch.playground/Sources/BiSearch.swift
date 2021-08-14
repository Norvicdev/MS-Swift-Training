import Foundation

public extension RandomAccessCollection where Element: Comparable {
  func biSearch(for value: Element, in range: Range<Index>? = nil) -> Index? {
    let _range = range ?? self.startIndex..<self.endIndex
    guard _range.lowerBound < _range.upperBound else {
      return nil
    }

    let size = self.distance(from: _range.lowerBound, to: _range.upperBound)
    let middleIndex = self.index(_range.lowerBound, offsetBy: size / 2)

    if self[middleIndex] == value {
      return middleIndex
    } else if self[middleIndex] > value {
      return biSearch(for: value, in: _range.lowerBound..<middleIndex)
    } else {
      return biSearch(for: value, in: index(after: middleIndex)..<_range.upperBound)
    }
  }
}
