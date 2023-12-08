import Foundation

let n = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map { Int(String($0))! }
var dp = [Int]()

func binarySearch(_ s: Int) -> Int {
    var left = 0, right = dp.count-1
    
    while left <= right {
        let mid = (left+right)/2
        
        if dp[mid] <= s {
            left = mid + 1
        } else {
            right = mid - 1
        }
    }
    
    return left
}

for a in arr {
    if dp.count == 0 || dp.last! < a {
        dp.append(a)
    } else {
        let idx = binarySearch(a)
        dp[idx] = a
    }
}

print(n-dp.count)
