import Foundation

let n = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map { Int(String($0))! }.sorted()
var result = 0

for i in 0..<n {
    var left = 0, right = arr.count-1
    while left < right {
        let s = arr[left] + arr[right]
        
        if s > arr[i] {
            right -= 1
        } else if s < arr[i] {
            left += 1
        } else {
            if i != left && i != right {
                result += 1
                break
            } else if i == left {
                left += 1
            } else {
                right -= 1
            }
        }
    }
}

print(result)
