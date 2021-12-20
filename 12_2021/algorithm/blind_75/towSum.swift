class Solution {
    func twoSumV1(_ nums: [Int], _ target: Int) -> [Int] {
      guard nums.count > 1 else { return [] }

      for (idx, num) in nums.enumerated() {
        for (j = idx + 1; j < nums.count; j++) {
          if (nums[j] + num[idx] == target) {
            return [idx, j]
          }
        }
      }

      return []
    }

    func twoSumV2(_ nums: [Int], _ target: Int) -> [Int] {
      guard nums.count > 1 else { return [] }

      let sortedNums = nums.sorted()
      var start = 0
      var end = nums.count - 1

      while start < end {
        let subSum = nums[start] + nums[end]
        if (subSum < target) {
          start += 1
        } else if (subSum > target) {
          end -= 1
        } else {
          return [start, end]
        }
      }

      return []
    }

    // v3 use dict
}