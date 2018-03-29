//: Playground - noun: a place where people can play

import Foundation


struct Fibonacci: Sequence {
    func makeIterator() -> FiboIterator {
        return FiboIterator()
    }
}

struct FiboIterator: IteratorProtocol {
    var state = (0, 1)

    mutating func next() -> Int? {
        let newValue = state.0
        state = (state.1, state.0 + state.1)
        return newValue
    }
}

let fibs = Fibonacci()


// MARK: - SubSequence

let fibo1 = fibs.prefix(10)
Array(fibo1)

let fibo2 = fibs.prefix(10).suffix(5)
Array(fibo2)

// drop
let fibo3 = fibs.dropFirst(10).prefix(10)
Array(fibo3)

let fibo4 = fibs.prefix(10).dropLast(5)
Array(fibo4)

// split
let fibo5 = fibs.prefix(10).split(whereSeparator: { $0 % 2 == 0 }).map(Array.init)
fibo5
