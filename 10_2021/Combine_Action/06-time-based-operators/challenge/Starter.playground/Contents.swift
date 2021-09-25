import Combine
import Foundation

// A subject you get values from
let subject = PassthroughSubject<Int, Never>()

let strings = subject
  .collect(.byTime(DispatchQueue.main, .seconds(0.5)))
  .map { array in
    String(array.map { Character(Unicode.Scalar($0)!) }) }




// Let's roll!
startFeeding(subject: subject)
