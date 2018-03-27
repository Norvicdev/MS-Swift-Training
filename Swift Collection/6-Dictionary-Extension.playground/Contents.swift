//: Playground - noun: a place where people can play

import Foundation

enum RecordType {
    case bool(Bool)
    case number(Int)
    case text(String)
}

let defaultRecord: [String: RecordType] = [
    "uid": .number(0),
    "exp": .number(100),
    "favourite": .bool(false),
    "title": .text("")
]

// How can we do this?
// template.merge(record11Patch)
// [
//    uid: .number(11),
//    "exp": .number(100),
//    "favourite": .bool(false),
//    "title": .text("Common dictionary extensions")
// ]

// MARK - Merge

extension Dictionary {
    mutating func merge<S: Sequence>(_ seq: S)
        where S.Iterator.Element == (key: Key, value: Value) {
            seq.forEach { self[$0] = $1 }
    }
}

// 1. marked as mutating: as the merge mutates the current dictionary
// 2. precondition check for merge, the key, value type of seq must be the same as self
// 3. the Key and Value types are two restrospect types for Sequence

var template = defaultRecord
var record11Patch: [String: RecordType] = [
    "uid": .number(11),
    "title": .text("Common dictionary extensions")
]
template.merge(record11Patch)


// MARK: - Init with tuple

// think of merge a sequence with an empty dictionary
// tuple is also a sequence
extension Dictionary {
    init<S: Sequence>(_ seq: S) where S.Iterator.Element == (key: Key, value: Value) {
        self = [:]
        self.merge(seq)
    }
}


// MARK: - Map

// by default, map for dictionary returns an array
let result = defaultRecord.map { $0 }

// map values only, return dictionary with value transformed
// dict -> map -> [(String, RecordType)]
// use [(String, RecordType)] to init the dict
extension Dictionary {
    func myMapValue<T>(_ transform: (Value) -> T) -> [Key: T] {
        return Dictionary<Key, T>(self.map { (k, v) in
            return (k, transform(v))
        })
    }
}
