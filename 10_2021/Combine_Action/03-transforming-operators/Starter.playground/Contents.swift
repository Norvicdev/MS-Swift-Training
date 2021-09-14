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

// If you throw an error, it will emit that error downstream
example(of: "Try Map") {
  Just("Dir does not exist")
    .tryMap { try
      FileManager.default.contentsOfDirectory(atPath: $0)
    }
    .sink(receiveCompletion: { debugPrint($0)},
          receiveValue: { debugPrint($0) })
    .store(in: &subscriptions)
}

example(of: "flatMap") {
  // 1
  let charlotte = Chatter(name: "Charlotte", message: "Hi, I'm Charlotte!")
  let james = Chatter(name: "James", message: "Hi, I'm James!")

  // 2
  let chat = CurrentValueSubject<Chatter, Never>(charlotte)

  chat
    .sink(receiveValue: { print($0.message.value) })
    .store(in: &subscriptions)

  charlotte.message.value = "Charlotte: How's it going?"
  chat.value = james
  // You are not subscribed to the message publisher
  // property of each emitted Chatter
}

example(of: "scan") {
  // 1
  var dailyGainLoss: Int { .random(in: -10...10) }

  // 2
  let august2021 = (0..<22)
    .map { _ in dailyGainLoss }
    .publisher

  // 3
  august2021
    .scan(50) { latest, current in
      debugPrint(latest, current)
      return max(0, latest + current)
    }
    .sink(receiveValue: { _ in })
    .store(in: &subscriptions)
}
