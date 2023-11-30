import Foundation

let nk = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = nk[0], k = nk[1]
var adjList = Array(repeating:[Int](), count: n+1)
var dp = Array(repeating: Array(repeating: 0, count: n+1), count: n+1)
for _ in 0..<k {
    let t = readLine()!.split(separator: " ").map { Int(String($0))! }
    adjList[t[0]].append(t[1])
}

func bfs(_ s: Int) {
    var visited = Array(repeating: false, count: n+1)
    var queue = [s]
    visited[s] = true
    
    while queue.count > 0 {
        let p = queue.removeFirst()
        
        for v in adjList[p] {
            if !visited[v] {
                queue.append(v)
                visited[v] = true
                dp[s][v] = -1
                dp[v][s] = 1
            }
        }
    }
}

for i in 1...n {
    bfs(i)
}

let s = Int(readLine()!)!
var result = ""
for _ in 0..<s {
    let t = readLine()!.split(separator: " ").map { Int(String($0))! }
    result += "\(dp[t[0]][t[1]])\n"
}

print(result)
