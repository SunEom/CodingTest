import Foundation

let nm = readLine()!.split(separator:" ").map { Int(String($0))! }
let n = nm[0], m = nm[1]

var inCnt = Array(repeating: 0, count: n+1)
var child = Array(repeating:[Int](), count: n+1)

var result = ""

for _ in 0..<m {
    let t = readLine()!.split(separator: " ").map { Int(String($0))! }
    inCnt[t[1]] += 1
    child[t[0]].append(t[1])
}

var queue = [Int]()

for i in 1...n {
    if inCnt[i] == 0 {
        queue.append(i)
    }
}

var idx = 0
var visited = Array(repeating: false, count: n+1)
var visitedCnt = 0
while visitedCnt < n {
    for i in 1...n {
        if !visited[i] && inCnt[i] == 0 {
            visitedCnt += 1
            visited[i] = true
            
            for c in child[i] {
                inCnt[c] -= 1
            }
            
            result += "\(i) "
            break
        }
    }
}

print(result)
