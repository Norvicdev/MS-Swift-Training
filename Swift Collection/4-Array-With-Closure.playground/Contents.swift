//: Playground - noun: a place where people can play

import Foundation


// MARK: - Iterate and do something

var fibonacci = [0, 1, 1, 2, 3, 5]
var squares = [Int]()

for value in fibonacci { squares.append(value * value) }
squares


// MARK: - Map

let constSquares = fibonacci.map { $0 * $0 }
constSquares


// MARK: - Map is nothing but encapsulate your looping technique

extension Array {
    func myMap<T>(_ transform: (Element) -> T) -> [T] {
        var result: [T] = []
        result.reserveCapacity(count)

        for item in self { result.append(transform(item)) }

        return result
    }
}

let anotherSquares = fibonacci.myMap { $0 * $0 }
anotherSquares

// myMap preserves the process of iterating array,
// while leave the actual data transform to the caller


// MARK: - Other Closure Operators

let filterResult = fibonacci.filter { $0 % 2 == 0 }
filterResult

let result1 = fibonacci.elementsEqual([0, 1, 1], by: { $0 == $1})
let result2 = fibonacci.starts(with: [0, 1, 1], by: { $0 == $1 })
result1
result2

fibonacci.sorted(by: >)
fibonacci.reduce(0, +)

// forEach doesn't deal with the return value inside the closure
let result3 = fibonacci.forEach { $0 + 1 }


// MARK: - Inner State v.s. Outter State

// Bad
// Using closure to modify a outter scope state
// Side effect
var sum = 0
let constSquares2 = fibonacci.map { (fib: Int) -> Int in
    sum += fib
    return fib * fib
}
constSquares2

// use reduce to get the sum you need
sum = fibonacci.reduce(0, +)

// However, you can define inner state to track the runtime info
extension Array {
    func accumulate<T>(_ initialValue: T, _ rule: (T, Element) -> T) -> [T] {
        var result = initialValue

        return map { next in
            result = rule(result, next)
            return result
        }
    }
}

fibonacci.accumulate(0, +)
fibonacci.accumulate(0, -)
