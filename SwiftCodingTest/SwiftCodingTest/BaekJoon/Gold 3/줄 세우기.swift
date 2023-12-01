import Foundation

let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = nm[0], m = nm[1]
var inCnt = Array(repeating: 0, count: n+1)
var adjList = Array(repeating: [Int](), count: n+1)
var result = ""
var queue = [Int]()

for _ in 0..<m {
    let t = readLine()!.split(separator: " ").map { Int(String($0))! }
    inCnt[t[1]] += 1
    adjList[t[0]].append(t[1])
}

for i in 1...n {
    if inCnt[i] == 0 {
        queue.append(i)
    }
}


while queue.count > 0 {
    let p = queue.removeFirst()
    result += "\(p) "
    
    for v in adjList[p] {
        inCnt[v] -= 1
        if inCnt[v] == 0 {
            queue.append(v)
        }
    }
}

print(result)

