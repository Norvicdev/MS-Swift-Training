//: Playground - noun: a place where people can play

import Foundation


struct Account {
    var alias: String
    var type: Int
    var createdAt: Date
}

let accountAlex = Account(alias: "alex",
                          type: 1,
                          createdAt  : Date())
//let data:[Account: Int] = [ accountAlex: 1000 ] error: key is not hashable

// MARK: - Hashable

//extension Account: Hashable {
//    // BAD
//    var hashValue: Int { return 1 }
//}

// 1. Hash collision each time you read the data
// 2. Dealing with hash collision -> O(1) -> O(N)

// How to make a good hash key
// 1. computational inexpensive
// 2. the randomness of hash key distribution

extension Account: Hashable {
    var hashValue: Int {
        return alias.hashValue ^ type.hashValue ^ createdAt.hashValue
    }
}

// 1. use XOR operator directly supported by CPU
// 2. also need to implement Equatable to tell two hash objects are the same

// MARK: - Equatable

extension Account: Equatable {
    static func == (lhs: Account, rhs: Account) -> Bool {
        return lhs.alias == rhs.alias &&
                lhs.type == rhs.type &&
                lhs.createdAt == rhs.createdAt
    }
}


// MARK: - Improvement Bitwise rotation

// use XOR will have increased chance of hash collision if properties in your object
// are of same type. Since a ^ b = b ^ a

struct AccountBit {
    var alias: String
    var type: Int
    var createdAt: Date

    let INT_BIT = (Int)(CHAR_BIT) * MemoryLayout<Int>.size

    func bitwiseRotate(value: Int, bits: Int) -> Int {
        return (((value) << bits) | ((value) >> (UInt.bitWidth - bits)))
    }
}

extension AccountBit: Hashable {
    var hashValue: Int {
        return bitwiseRotate(value: alias.hashValue, bits: 10) ^
            type.hashValue ^
            createdAt.hashValue
    }
}

extension AccountBit: Equatable {
    static func == (lhs: AccountBit, rhs: AccountBit) -> Bool {
        return lhs.alias == rhs.alias &&
            lhs.type == rhs.type &&
            lhs.createdAt == rhs.createdAt
    }
}

// MARK: - Pro Tips

// Do not use reference type as a key, i.e. object or closure
// reference type can get changed at any time, so the original key for that reference
// get changed as well. you can't retrieve the value any more...
