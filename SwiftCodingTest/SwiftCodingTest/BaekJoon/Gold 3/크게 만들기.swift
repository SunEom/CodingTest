import Foundation

let nk = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = nk[0], k = nk[1]
let arr = Array(readLine()!).map { Int(String($0))! }
var stack = [Int]()
var removeCnt = 0
for a in arr {
    
    if stack.count == 0 {
        stack.append(a)
        continue
    }
    
    while removeCnt < k && stack.count > 0 && stack.last! < a {
        _ = stack.removeLast()
        removeCnt += 1
    }
    
    stack.append(a)
}

while removeCnt < k {
    _ = stack.removeLast()
    removeCnt += 1
}

print(stack.map { String($0) }.joined())
