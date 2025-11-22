import UIKit

/**
 Question:
 Given a sorted array of integers nums and an integer target, return the indices of the two numbers that add up to target.
  Use the two-pointer technique.
  If no pair exists, return an empty array.
 Example:

 nums = [1, 2, 4, 6, 10], target = 8
 Output: [1, 3]   // 2 + 6 = 8
 */

//func findTarget(_ nums: [Int], _ target: Int) -> [Int] {
//    var left = 0
//    var right = nums.count - 1
//    
//    while left < right {
//        if nums[left] + nums[right] == target {
//            return [left, right]
//        } else if nums[left] + nums[right] > target {
//            right -= 1
//        } else {
//            left += 1
//        }
//    }
//
//    return []
//}
//
//print(findTarget([1, 2, 4, 6, 10], 8))
//// O(n^2)

func isPalindrome(_ s: String) -> Bool {
    if s.isEmpty { return false }
    let chars = Array(s.lowercased())
    var left = 0
    var right = chars.count - 1

    while left < right {
        if chars[left] != chars[right] {
            return false
        }

        left += 1
        right -= 1
    }

    return true
}

print(isPalindrome("ama"))
