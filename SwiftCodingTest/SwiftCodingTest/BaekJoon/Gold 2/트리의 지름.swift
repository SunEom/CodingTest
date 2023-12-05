import Foundation

let v = Int(readLine()!)!
var adjList = Array(repeating: [[Int]](), count: v+1)
for _ in 0..<v {
    let t = readLine()!.split(separator: " ").map { Int(String($0))! }
    
    var i = 1
    
    while t[i] != -1 {
        adjList[t[0]].append([t[i], t[i+1]])
        i += 2
    }
}

func bfs(_ s:Int) -> [Int] {
    var visited = Array(repeating: -1, count: v+1)
    visited[s] = 0
    var maxDist = 0
    var maxIdx = s
    
    var queue = [s]
    var idx = 0
    while queue.count > idx {
        let p = queue[idx]
        
        for li in adjList[p] {
            if visited[li[0]] == -1 {
                visited[li[0]] = visited[p] + li[1]
                if visited[li[0]] > maxDist {
                    maxDist = visited[li[0]]
                    maxIdx = li[0]
                }
                queue.append(li[0])
            }
        }
        
        idx += 1
    }
    
    return [maxDist, maxIdx]
}

let temp = bfs(1)

var result = bfs(temp[1])

print(result[0])
