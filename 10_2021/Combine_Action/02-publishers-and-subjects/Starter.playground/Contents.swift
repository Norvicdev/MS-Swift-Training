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


example(of: "PassThroughSubject") {
  enum MyError: Error {
    case test
  }

  final class StringSub: Subscriber {
    typealias Input = String
    typealias Failure = MyError

    func receive(subscription: Subscription) {
      subscription.request(.max(2))
    }

    func receive(_ input: String) -> Subscribers.Demand {
      debugPrint("Received value", input)
      return input == "PcY" ? .max(1) : .none
    }

    func receive(completion: Subscribers.Completion<MyError>) {
      debugPrint("Received completion", completion)
    }
  }

  let sub = StringSub()
  let subject = PassthroughSubject<String, MyError>()
  subject.subscribe(sub)

  let subscription = subject
    .sink(
      receiveCompletion: { completion in
        debugPrint("Received completion (sink)", completion)
      },
      receiveValue: { value in
        debugPrint("Received value (sink)", value)
      }
    )

  subject.send("Hello")
  subject.send("PcY")
  subject.send("JJP")
}


example(of: "Future") {
  func futureIncrement(
    integer: Int,
    afterDelay delay: TimeInterval) -> Future<Int, Never> {

    Future<Int, Never> { promise in
      DispatchQueue.global().asyncAfter(deadline: .now() + delay) {
        promise(.success(integer + 1))
      }
    }
  }

  let future = futureIncrement(integer: 1, afterDelay: 3)
  future
    .sink(receiveCompletion: { debugPrint($0) },
          receiveValue: { debugPrint($0) })
    .store(in: &subscriptions)
}


example(of: "Type erasure") {
  // 1
  let subject = PassthroughSubject<Int, Never>()

  // 2
  let publisher = subject.eraseToAnyPublisher()

  // 3
  publisher
    .sink(receiveValue: { print($0) })
    .store(in: &subscriptions)

  // 4
  subject.send(0)
}
