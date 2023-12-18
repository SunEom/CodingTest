import Foundation

let str = Array(readLine()!)
let target = Array(readLine()!)
let tcnt = target.count

var stack = [Character]()

for c in str {
    stack.append(c)
    
    while stack.count >= target.count && Array(stack[stack.count-tcnt..<stack.count]) == target {
        for _ in 0..<tcnt {
            _ = stack.removeLast()
        }
    }
}

if stack.count > 0 {
    print(stack.map { String($0) }.joined())
} else {
    print("FRULA")
}
