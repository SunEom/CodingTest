import Foundation

let n = Int(readLine()!)!
let arr = readLine()!.split(separator:" ").map { Int(String($0))! }.sorted()
var minS = Int.max
var result = [Int]()

for k in 0..<n-2 {
    var left = k+1, right = n-1
    
    while left < right {
        let s = arr[k] + arr[left] + arr[right]
        
        if abs(s) < minS {
            minS = abs(s)
            result = [arr[k], arr[left],  arr[right]]
        }
        
        if s < 0 {
            left += 1
        } else {
            right -= 1
        }
    }
}

print("\(result[0]) \(result[1]) \(result[2])")
