import Foundation

let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = nm[0], m = nm[1]
var inCnt = Array(repeating: 0, count: n+1)
var next = Array(repeating: [Int](), count: n+1)
var result = [Int]()

for _ in 0..<m {
    let temp = readLine()!.split(separator: " ").map { Int(String($0))! }
    
    for i in 2..<temp.count {
        inCnt[temp[i]] += 1
        next[temp[i-1]].append(temp[i])
    }
}

var queue = [Int]()

for i in 1...n {
    if inCnt[i] == 0 {
        queue.append(i)
    }
}

while queue.count > 0 {
    let p = queue.removeFirst()
    result.append(p)
    
    for v in next[p] {
        inCnt[v] -= 1
        if inCnt[v] == 0 {
            queue.append(v)
        }
    }
}

if result.count != n {
    print(0)
} else {
    for v in result {
        print(v)
    }
}
