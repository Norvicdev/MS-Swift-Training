import Foundation
import Combine

var subscriptions = Set<AnyCancellable>()

example(of: "Create a Blackjack card dealer") {
  let dealtHand = PassthroughSubject<Hand, HandError>()
  
  func deal(_ cardCount: UInt) {
    var deck = cards
    var cardsRemaining = 52
    var hand = Hand()
    
    for _ in 0 ..< cardCount {
      let randomIndex = Int.random(in: 0 ..< cardsRemaining)
      hand.append(deck[randomIndex])
      deck.remove(at: randomIndex)
      cardsRemaining -= 1
    }
    
    // Add code to update dealtHand here
    
  }
  
  // Add subscription to dealtHand here
  
  
  deal(3)
}
