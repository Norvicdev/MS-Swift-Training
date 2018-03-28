//: Playground - noun: a place where people can play

import Foundation


struct FiboIterator: IteratorProtocol {
    var state = (0, 1)

    mutating func next() -> Int? {
        let nextValue = state.0
        state = (state.1, state.0 + state.1)
        return nextValue
    }
}

struct FiboSequence: Sequence {
    func makeIterator() -> FiboIterator {
        return FiboIterator()
    }
}


// MARK: - Copy By Value, Iterator

let fibos = FiboSequence()
var iter1 = fibos.makeIterator()
var iter2 = iter1

// the iterator doesn't share the state
iter1.next()
iter1.next()

iter2.next()


// MARK: - Copy By Reference, AnyIterator

// by wrapping Iterator into AnyIterator, you share iterator states
struct Fibonacci: Sequence {
    typealias Element = Int

    func makeIterator() -> AnyIterator<Element> {
        return AnyIterator(FiboIterator())
    }
}

let fibonacci = Fibonacci()
var iterRef1 = fibonacci.makeIterator()
var iterRef2 = iterRef1

// the iterator now share the states
iterRef1.next()
iterRef1.next()

iterRef2.next()
iterRef2.next()


// MARK: - Tired of Creating Struct for Custom Sequence and Iterator ?

// use AnySequence and AnyIterator
func fiboIterator() -> AnyIterator<Int> {
    var state = (0, 1)

    return AnyIterator {
        let nextValue = state.0
        state = (state.1, state.0 + state.1)

        return nextValue
    }
}

let fib = AnySequence(fiboIterator)
Array(fib.prefix(10))
