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


example(of: "Custom Subscriber") {
  let pub = (1...6).publisher

  final class IntSub: Subscriber {
    typealias Input = Int
    typealias Failure = Never

    func receive(subscription: Subscription) {
      subscription.request(.max(3))
    }

    func receive(_ input: Int) -> Subscribers.Demand {
      debugPrint("Received value", input)
      return .none
    }

    func receive(completion: Subscribers.Completion<Never>) {
      debugPrint("Received completion", completion)
    }
  }

  let sub = IntSub()
  pub.subscribe(sub)
}
