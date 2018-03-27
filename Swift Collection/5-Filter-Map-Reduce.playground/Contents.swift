
import Foundation

// MARK: - Filter

var fibonacci = [0, 1, 1, 2, 3, 5]
fibonacci.filter { $0 % 2 == 0 }

extension Array {
    func myFilter(_ rule: (Element) -> Bool) -> [Element] {
        var result: [Element] = []

        for value in self where rule(value) {
            result.append(value)
        }

        return result
    }
}

// filter out the elements that meets certain rule
extension Array {
    func reject(_ rule: (Element) -> Bool) -> [Element] {
        return filter { !rule($0) }
    }
}

let result1 = fibonacci.reject { $0 % 2 == 0 }
result1


// MARK: - Contains

// contains won't loop through enitre collection, early exit
fibonacci.contains(2)

// contains all
extension Array {
    func containsAll(_ predicate: (Element) -> Bool) -> Bool {
        return !contains { !predicate($0) }
    }
}

let evens = [2, 4, 6, 8]
evens.containsAll { $0 % 2 == 0 }


// MARK: - Reduce

fibonacci.reduce(0, +)

extension Array {
    func myReduce<T>(_ initialValue: T, _ rule: (T, Element) -> T) -> T {
        var result: T = initialValue

        for value in self {
            result = rule(result, value)
        }

        return result
    }
}

fibonacci.myReduce(0, +)


// MARK: - FlatMap

extension Array {
    func myFlatMap<T>(_ transform: (Element) -> [T]) -> [T] {
        var result: [T] = []

        for value in self {
            result.append(contentsOf: transform(value))
        }

        return result
    }
}
