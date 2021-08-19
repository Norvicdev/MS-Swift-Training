//
//  ShiftLetters.swift
//  Sort_It
//
//  Created by Alex Jiang on 19/8/21.
//

import Foundation

// https://leetcode.com/problems/shifting-letters/
public func shiftLetters(_ s: String, _ shifts: [Int]) -> String {

  func shiftCharacter(_ c: Character, _ shift: Int) -> Character {
    let alphabet = Array("abcdefghijklmnopqrstuvwxyz")
    let length = alphabet.count
    let code = alphabet.firstIndex(of: c)! + shift

    return alphabet[code % length]
  }

  func shiftCharacters(_ s: String, shift: Int, number: Int) -> String {
    var result = [Character]()

    for (index, char) in s.enumerated() {
      if index < number {
        result.append(shiftCharacter(Character(extendedGraphemeClusterLiteral: char), shift))
      } else {
        result.append(Character(extendedGraphemeClusterLiteral: char))
      }
    }

    return String(result)
  }

  let strArray = Array(s)
  for i in 0..<shifts.count {
    
  }

  return ""
}
