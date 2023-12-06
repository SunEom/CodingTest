import Foundation

let n = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map { Int(String($0))! }
var queue = [Int]()

func binarySearch(_ num: Int) -> Int {
    var left = 0, right = queue.count-1
    
    while left < right {
        let mid = (left+right)/2
        
        if queue[mid] < num {
            left = mid+1
        } else {
            right = mid
        }
    }
    
    return left
}

for n in arr {
    if queue.count == 0 || queue.last! < n {
        queue.append(n)
    } else {
        let idx = binarySearch(n)
        queue[idx] = n
    }
}

print(queue.count)
