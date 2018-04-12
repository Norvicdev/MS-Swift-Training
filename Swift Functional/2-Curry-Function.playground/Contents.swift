//
//  Created by Alex Jiang on 11/4/18.
//  Copyright © 2018 Junliang Jiang All rights reserved.

import Foundation


// MARK: - Curry

// https://github.com/apple/swift-evolution/blob/master/proposals/0002-remove-currying.md

func curryExplaination<A, B, C>(_ f: @escaping (A, B) -> C) -> (A) -> (B) -> C {
    return { (a: A) -> (B) -> C in
        { (b: B) -> C in f(a, b) }
    }
}

// which, can be simplied:

/// Curry a fuction with two input parameters
///
/// - Parameter f: function with two input parameters
/// - Returns: a curried function
///
/// - Example:
/// ```
/// let op: (Int, Int) -> Int = (+)
/// let add = curry(op)
/// add2(1) // 3
/// let result = (1...5).map(add(2)) // [3, 4, 5, 6, 7]
///
/// let result = sequence.map(concat(square, increment, String.init, isNumber)) // [true, true, true, true]
func curry<A, B, C>(_ f: @escaping (A, B) -> C) -> (A) -> (B) -> C {
    return { a in { b in f(a, b) } }
}

let op: (Int, Int) -> Int = (+)
let add = curry(op)
let add2 = add(2)
add2(1)
(1...5).map(add(2))

/// Curry a fuction with three input parameters
///
/// - Parameter f: function with three input parameters
/// - Returns: a curried function
///
/// - Example:
/// ```
/// let op: (Int, Int, Int) -> Int = { (a: Int, b: Int, c: Int) -> Int in return (a + b) * c }
/// let add = curry(op)
/// add2(1) // 3
/// let result = (1...5).map(add(2)) // [3, 4, 5, 6, 7]
///
/// let result = sequence.map(concat(square, increment, String.init, isNumber)) // [true, true, true, true]
func curry<A, B, C, D>(_ f: @escaping (A, B, C) -> D) -> (A) -> (B) -> (C) -> D {
    return { a in { b in { c in f(a, b, c) } } }

}

func curry<A, B, C, D, E>(_ f: @escaping (A, B, C, D) -> E) -> (A) -> (B) -> (C) -> (D) -> E {
    return { a in { b in { c in { d in f(a, b, c, d) }}}}
}
