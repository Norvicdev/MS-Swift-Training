//
//  Created by Alex Jiang on 11/4/18.
//  Copyright © 2018 Junliang Jiang All rights reserved.

import Foundation


func isAnagram(a: String, b: String) -> Bool {
    guard a.count == b.count else { return false }

    return a.sorted() == b.sorted()
}

isAnagram(a: "abc", b: "bca")
isAnagram(a: "abde", b: "ebad")
isAnagram(a: "123", b: "231")
isAnagram(a: "badad", b: "124124")


func isAnagramV2(a: String, b: String) -> Bool {
    guard a.count == b.count else { return false }

    var lookup: [Character: Int] = [:]

    a.forEach { lookup[$0, default: 0] += 1 }
    b.forEach { lookup[$0, default: 0] -= 1 }

    debugPrint(lookup)
    return !lookup.values.contains(where: { $0 != 0 })
}

isAnagramV2(a: "abc", b: "bca")
isAnagramV2(a: "abde", b: "ebad")
isAnagramV2(a: "123", b: "777")
isAnagramV2(a: "badad", b: "124124")
