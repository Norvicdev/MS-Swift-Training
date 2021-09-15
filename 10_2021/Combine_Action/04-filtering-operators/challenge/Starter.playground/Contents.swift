import Foundation
import Combine

var subscriptions = Set<AnyCancellable>()

example(of: "filter") {
  let pub = (1...100).publisher

  pub
    .drop(while: { $0 <= 50 })
    .prefix(20)
    .filter({ $0.isMultiple(of: 2)})
    .sink(receiveValue: { print($0) })
    .store(in: &subscriptions)
}


