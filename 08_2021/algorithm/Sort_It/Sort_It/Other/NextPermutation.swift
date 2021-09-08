//
//  NextPermutation.swift
//  Sort_It
//
//  Created by Alex Jiang on 7/9/21.
//

import Foundation

// https://leetcode-cn.com/problems/next-permutation/
// 我们需要将一个左边的「较小数」与一个右边的「较大数」交换，以能够让当前排列变大，从而得到下一个排列
extension Solution {
  func nextPermutation(_ nums: inout [Int]) {
    guard nums.count > 1 else { return }

    // first scan
    var i = nums.count - 1
    while (i - 1) >= 0 && nums[i] < nums[i - 1] {
      i -= 1
    }

    // second scan
    var j = nums.count - 1
    while (j >= i) && nums[i - 1] > nums[j] {
      j -= 1
    }

    nums.swapAt(i - 1, j)

    nums = nums[0...i - 1] + nums[i...].reversed()
  }
}
