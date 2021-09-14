import Foundation
import Combine

var subscriptions = Set<AnyCancellable>()

// MARK: - Collecting values

example(of: "collect") {
  ["A", "B", "C", "D", "E"].publisher
    .collect(3)
    .sink(receiveCompletion: { print($0) },
          receiveValue: { print($0) })
    .store(in: &subscriptions)
}

// MARK: - Mapping values

example(of: "map") {
  let formatter = NumberFormatter()
  formatter.numberStyle = .spellOut

  [96, 503, 50, 202, 157, 101].publisher
    .map {
      formatter.string(for: NSNumber(integerLiteral: $0)) ?? ""
    }
    .sink(receiveValue: { debugPrint($0) })
    .store(in: &subscriptions)
}

example(of: "map key paths") {
  let pub = PassthroughSubject<Coordinate, Never>()

  pub
    .map(\.x, \.y)
    .sink { (x, y) in
      debugPrint(
        "The coordinate at (\(x), \(y)) is in quadrant",
        quadrantOf(x: x, y: y)
      )
    }
    .store(in: &subscriptions)

  pub.send(Coordinate(x: 10, y: -8))
  pub.send(Coordinate(x: 0, y: 5))
}

example(of: "Try Map") {
  Just("Dir does not exist")
    .tryMap { try
      FileManager.default.contentsOfDirectory(atPath: $0)
    }
    .sink(receiveCompletion: { debugPrint($0)},
          receiveValue: { debugPrint($0) })
    .store(in: &subscriptions)
}
