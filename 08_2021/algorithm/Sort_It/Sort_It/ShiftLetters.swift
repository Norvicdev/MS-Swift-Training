//
//  ShiftLetters.swift
//  Sort_It
//
//  Created by Alex Jiang on 19/8/21.
//

import Foundation

// https://leetcode.com/problems/shifting-letters/
public func shiftLetters(_ s: String, _ shifts: [Int]) -> String {

  // Input: c = "a", shifts = 3
  // Output: "d"
  func shiftCharacter(_ c: Character, _ shift: Int) -> Character {
    let alphabet = Array("abcdefghijklmnopqrstuvwxyz")
    let length = alphabet.count
    let code = alphabet.firstIndex(of: c)! + shift

    return alphabet[code % length]
  }

  // Input: s = "abc", shifts = 3, number = 1
  // Output: "dbc"
  func shiftCharacters(_ s: String, _ shift: Int, _ number: Int) -> String {
    var result = [Character]()

    for (index, char) in Array(s).enumerated() {
      if index < number {
        result.append(shiftCharacter(char, shift))
      } else {
        result.append(char)
      }
    }

    return String(result)
  }

  var result = s
  for i in 0..<shifts.count {
    result = shiftCharacters(result, shifts[i], i + 1)
  }

  return result
}
