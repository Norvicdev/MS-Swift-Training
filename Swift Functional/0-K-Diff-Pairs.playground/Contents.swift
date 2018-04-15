//
//  Created by Alex Jiang on 13/4/18.
//  Copyright © 2018 Junliang Jiang All rights reserved.

import Foundation

// MARK: - Question 1


/// Determine if two strings are anagrams
///
/// - Parameters:
///   - word1: string input #1
///   - word2: string input #2
/// - Returns: true if two strings are anagrams, false otherwise
///
/// - Complexity:
///   - Time: O(nlogn) # .sorted() in swift lib upper to bound O(nlogn)
///   - Space: O(1)
///
func isAnagram(word1: String, word2: String) -> Bool {
    guard word1.count == word2.count else { return false }

    return word1.sorted() == word2.sorted()
}

isAnagram(word1: "", word2: "bca")
isAnagram(word1: "", word2: "")
isAnagram(word1: "abc", word2: "bca")
isAnagram(word1: "abde", word2: "ebad")
isAnagram(word1: "123", word2: "231")
isAnagram(word1: "badad", word2: "124124")


/// Determine if two strings are anagrams (version 2)
///
/// - Parameters:
///   - word1: string input #1
///   - word2: string input #2
/// - Returns: true if two strings are anagrams, false otherwise
///
/// - Complexity:
///   - Time: O(n)
///   - Space: O(1) # the hash map space is confined to the limited character set
///
func isAnagramV2(word1: String, word2: String) -> Bool {
    guard word1.count == word2.count else { return false }

    var lookup: [Character: Int] = [:]

    word1.forEach { lookup[$0, default: 0] += 1 }
    word2.forEach { lookup[$0, default: 0] -= 1 }

    debugPrint(lookup)
    return !lookup.values.contains(where: { $0 != 0 })
}

isAnagramV2(word1: "", word2: "bca")
isAnagramV2(word1: "", word2: "")
isAnagramV2(word1: "abc", word2: "bca")
isAnagramV2(word1: "abde", word2: "ebad")
isAnagramV2(word1: "123", word2: "777")
isAnagramV2(word1: "badad", word2: "124124")



// MARK: - Question 2



/// Given an array of integers, return the number of unique pairs that have difference delta
///
/// - Parameters:
///   - numbers: an input array of integers
///   - delta: an integer difference delta
/// - Returns: the number of unique pairs that have difference delta
///
/// - Complexity:
///   - Time: O(n)
///
func uniquePairs(numbers: [Int], delta: Int) -> Int {
    guard delta >= 0 else { return 0 }
    guard numbers.count > 1 else { return 0 }

    var result = 0, lookup: [Int: Int] = [:]

    numbers.forEach { lookup[$0, default: 0] += 1 }

    lookup.forEach { (key, value) in
        if delta == 0 && value > 1 { result += 1 }
        if delta > 0 && lookup.keys.contains(key + delta) { result += 1 }
    }

    return result
}

uniquePairs(numbers: [], delta: 3)
uniquePairs(numbers: [1, 2, 2, 3], delta: -2)
uniquePairs(numbers: [1, 2, 2, 3], delta: 0)
uniquePairs(numbers: [4, 1, 3, 1, 5], delta: 2)
uniquePairs(numbers: [4, 1, 3, 1, 5], delta: 1)
uniquePairs(numbers: [5, 4, 3, 2, 1], delta: 1)
uniquePairs(numbers: [1, 4, 5, 7, 8, 9], delta: 3)
