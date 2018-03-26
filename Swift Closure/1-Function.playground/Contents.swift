//  Microsoft Mobile Coaching
//
//  Created by Alex Jiang on 7/3/18.
//  Copyright © 2018 Alex Jiang. All rights reserved.


import Foundation

// MARK: - A Simple Function

func echoName() {
    debugPrint("My name is Alex")
}

// func是定义函数的关键字，后面是函数名；
// ()中是可选的参数列表，既然是最简单的函数，自然我们可以让它留空；
// ()后面，是函数的返回值，同样，简单起见，我们也没有定义返回值；
// {}中是函数要封装的逻辑，其实，在这里，我们调用的debugPrint，也是一个函数，
// 只不过，它是一个定义在标准库中的函数，并且带有一个参数罢了；


// MARK: - Pass Parameters into Function

func multiple(m: Int, n: Int) {
    debugPrint(m * n)
}

multiple(m: 3, n: 2)

func multiple(multiplicated m: Int, of n: Int) {
    debugPrint(m * n)
}

multiple(multiplicated: 3, of: 2)

func multiple(_ m: Int, of n: Int) {
    debugPrint(m * n)
}

multiple(3, of: 2)

// m, n are internal name
// if no external name specified, the external name will be the same as internal name
// or we can define our own external name
// multiplicated, of are external name
// we can use _ to omit external name


// MARK: - Default Parameter Value

func multiple(_ m: Int, _ n: Int = 2) {
    debugPrint(m * n)
}

multiple(3)


// MARK: - Variable length of parmeter

func multiple(numbers: Int...) {
    // numbers is of type Array
    let arrayMul = numbers.reduce(1, *)
    debugPrint(arrayMul)
}

multiple(numbers: 1, 2, 3, 4)


// MARK: - Inout Parameter

func multiple(result: Int, _ numbers: Int ...) {
//    result = numbers.reduce(1, *) // !!! Error here !!!
    debugPrint(result)
}

func multiple(result: inout Int, _ numbers: Int ...) {
    result = numbers.reduce(1, *)
    debugPrint(result)
}

var result = 0
multiple(result: &result, 2, 3, 4, 5)
