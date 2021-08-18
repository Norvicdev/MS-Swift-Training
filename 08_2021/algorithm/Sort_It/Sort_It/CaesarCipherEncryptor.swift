//
//  CaesarCipherEncryptor.swift
//  Sort_It
//
//  Created by Alex Jiang on 18/8/21.
//

import Foundation

public func caesarCipherEncryptor(string: String, key: UInt32) -> String {
  func getNewLetter(_ letter: Character,
                    _ key: UInt32,
                    _ alphabet: [Character]) -> Character {
    let code = alphabet.firstIndex(of: letter)! + Int(key)
    let length = alphabet.count

    if code < length {
      return alphabet[code]
    } else {
      return alphabet[-1 + code % length]
    }
  }

  var newLetters = [Character]()
  let alphabet = Array("abcdefghijklmnopqrstuvwxyz")
  let newKey = key % UInt32(alphabet.count)

  for c in string {
    newLetters.append(getNewLetter(c, newKey, alphabet))
  }

  return String(newLetters)
}
