## Cheatsheet - Swift Collection

#### My Map, Filter, Reduce in Array

```swift
extension Array {
    func myMap<T>(_ transform: (Element) -> T) -> [T] {
        var result: [T] = []

        for item in self {
            result.append(transform(item))
        }

        return result
    }
}
```

```swift
extension Array {
    func myFilter(_ rule: (Element) -> Bool) -> [Element] {
        var result: [Element] = []

        for item in self where rule(item) {
            result.append(item)
        }

        return result
    }
}
```

```swift
extension Array {
    func myReduce<T>(_ initialValue: T, _ rule: (T, Element) -> T) -> T {
        var result: T = initialValue

        for item in self {
            result = rule(result, item)
        }

        return result
    }
}
```

#### My Merge in Dictionary

```swift
extension Dictionary {
    mutating func myMerge<S: Sequence>(_ seq: S) where S.Iterator.Element == (key: Key, value: Value) {
        for (key, value) in seq {
            self[key] = value
        }
    }
}
```

#### My Collection

```swift
extension Collection {
    private func indicesArray() -> [Self.Index] {
        var indices: [Self.Index] = []
        var anIndex = startIndex
        while anIndex != endIndex {
            indices.append(anIndex)
            anIndex = index(after: anIndex)
        }
        return indices
    }

    subscript(safe idx: Index) -> Iterator.Element? {
        return indices.contains(idx) ? self[idx] : nil
    }

    func forEachConcurrent(_ each: (Element) -> Void) {
        let idxs = indicesArray()

        DispatchQueue.concurrentPerform(iterations: idxs.count) {
            let itemIndex = idxs[$0]
            each(self[itemIndex])
        }
    }
}
```