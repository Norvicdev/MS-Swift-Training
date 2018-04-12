//
//  Created by Alex Jiang on 11/4/18.
//  Copyright © 2018 Junliang Jiang All rights reserved.

import Foundation


// MARK: - connect series of functions

/// Function Composition
///
/// - Parameters:
///   - f: function f takes label parameter a as input, return type B
///   - g: function g takes label parameter b as input, return type C
/// - Returns: a composition function takes label a as input, return type C
///
/// - Example:
/// ```
/// let sequence = [1, 2, 3, 4]
/// let square = { (v: Int) -> Int in return v * v }
/// let increment = { (v: Int) -> Int in return v + 1 }
///
/// let result = sequence.map(concat(square, increment)) // [2, 5, 10, 17]
/// ```
///
func concat<A, B, C>(
    _ f: @escaping (_ a: A) -> B,
    _ g: @escaping (_ b: B) -> C)
    -> (A) -> C {

    return { (a: A) -> C in
        g(f(a))
    }
}

/// Function Composition
///
/// - Parameters:
///   - f: function f takes label parameter a as input, return type B
///   - g: function g takes label parameter b as input, return type C
///   - h: function h takes label parameter c as input, return type D
/// - Returns: a composition function takes label a as input, return type D
///
/// - Example:
/// ```
/// let sequence = [1, 2, 3, 4]
/// let square = { (v: Int) -> Int in return v * v }
/// let increment = { (v: Int) -> Int in return v + 1 }
///
/// let result = sequence.map(concat(square, increment, String.init)) // ["2", "5", "10", "17"]
/// ```
///
func concat<A, B, C, D>(
    _ f: @escaping (_ a: A) -> B,
    _ g: @escaping (_ b: B) -> C,
    _ h: @escaping (_ c: C) -> D)
    -> (A) -> D {

        return { (a: A) -> D in
            h(g(f(a)))
        }
}

/// Function Composition
///
/// - Parameters:
///   - f: function f takes label parameter a as input, return type B
///   - g: function g takes label parameter b as input, return type C
///   - h: function h takes label parameter c as input, return type D
///   - i: function i takes label parameter i as input, return type E
/// - Returns: a composition function takes label a as input, return type E
///
/// - Example:
/// ```
/// let sequence = [1, 2, 3, 4]
/// let square = { (v: Int) -> Int in return v * v }
/// let increment = { (v: Int) -> Int in return v + 1 }
/// let isNumber = { (v: String) -> Bool in return Int(v) == nil ? false : true }
///
/// let result = sequence.map(concat(square, increment, String.init, isNumber)) // [true, true, true, true]
/// ```
///
func concat<A, B, C, D, E>(
    _ f: @escaping (_ a: A) -> B,
    _ g: @escaping (_ b: B) -> C,
    _ h: @escaping (_ c: C) -> D,
    _ i: @escaping (_ d: D) -> E)
    -> (A) -> E {

        return { (a: A) -> E in
            i(h(g(f(a))))
        }
}

let sequence = [1, 2, 3, 4]
let square = { (v: Int) -> Int in return v * v }
let increment = { (v: Int) -> Int in return v + 1 }
let isNumber = { (v: String) -> Bool in return Int(v) == nil ? false : true }

let result = sequence.map(concat(square, increment))
let result2 = sequence.map(concat(square, increment, String.init))
let result3 = sequence.map(concat(square, increment, String.init, isNumber))
