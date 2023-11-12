import Foundation

func solution(_ s:String) -> Int {
    let s = Array(s)
    var result = 0
    for i in 0..<s.count {
        for j in i..<s.count {
            var left = i, right = j
            
            while left <= right && s[left] == s[right] {
                left += 1
                right -= 1
            }
            
            if left > right {
                result = max(result, j - i + 1)
            }
        }
    }

    return result
}
