import Foundation
import Combine

var subscriptions = Set<AnyCancellable>()

example(of: "Publisher") {
  let notify1 = Notification.Name("notify1")
  let publisher = NotificationCenter
    .default
    .publisher(for: notify1, object: nil)

  let center = NotificationCenter.default
  let observer = center.addObserver(
    forName: notify1,
    object: nil,
    queue: nil) { (_) in
    debugPrint("notification received")
  }

  center.post(name: notify1, object: nil)
  center.removeObserver(observer)
}

example(of: "Just") {
  let pub = Just("Hello, PcY!")

  _ = pub.sink(
    receiveCompletion: { print("Received completion", $0)
    },
    receiveValue: { print("Received value", $0)
    })
}


example(of: "assign to on") {
  class SomeObject {
    var str: String = "" {
      didSet {
        debugPrint(str)
      }
    }
  }

  let object = SomeObject()
  let pub = ["Hello", "PcY", "JJP"].publisher

  _ = pub
    .assign(to: \.str, on: object)
}
