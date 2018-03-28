//: Playground - noun: a place where people can play

import Foundation


let numbers = [1, 2, 3, 4, 5]

for number in numbers {
    print(number)
}


// MARK: - How to express a sequence that you can visit by order ?

// we use `Iterator` object to visit each item in a collection
protocol Sequence {
    associatedtype Iterator: IteratorProtocol

    func makeIterator() -> Iterator
}

// How to design an Iterator ?
// 1. need to know how many items in a collection
// 2. need to know how to visit next item
protocol IteratorProtocol {
    associatedtype Element

    mutating func next() -> Element?
}

// To any type that conforms to Sequence,
// 1. use makeIterator to get the Iterator
// 2. keep asking next item, until nil

var begin = numbers.makeIterator()

while let number = begin.next() { debugPrint(number) }


// MARK: - Custom Sequence

struct Fibonacci: Sequence {
    func makeIterator() -> FiboIterator {
        return FiboIterator()
    }
}

struct FiboIterator: IteratorProtocol {
    var state = (0, 1)

    mutating func next() -> Int? {
        let nextValue = state.0
        state = (state.1, state.0 + state.1)
        return nextValue
    }
}

let fibSequence = Fibonacci()
var fibIter = fibSequence.makeIterator()
var i = 1

while let value = fibIter.next(), i != 10 {
    debugPrint(value)
    i += 1
}
