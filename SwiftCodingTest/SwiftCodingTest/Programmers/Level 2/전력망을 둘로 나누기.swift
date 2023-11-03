import Foundation

var adjMat = [[Int]]()

func bfs(_ n: Int, _ s: Int, _ except: [Int]) -> Int {
    var visited = Array(repeating: false, count: n+1)
    visited[s] = true
    var cnt = 1
    var queue = [s]
    var idx = 0
    while idx < queue.count {
        let p = queue[idx]
        for i in 1...n {
            if adjMat[p][i] == 1 && !visited[i] {
                if [i, p] == except || [p, i] == except {
                    continue
                } else {
                    cnt += 1
                    queue.append(i)
                    visited[i] = true
                }
            }
        }
        idx += 1
    }
    
    return cnt
    
}

func solution(_ n:Int, _ wires:[[Int]]) -> Int {
    var result = Int.max
    adjMat = Array(repeating:Array(repeating: 0 , count:n+1), count: n+1)
    
    for wire in wires {
        adjMat[wire[0]][wire[1]] = 1
        adjMat[wire[1]][wire[0]] = 1
    }
    
    for wire in wires {
        let t = bfs(n, wire[0], wire)
        result = min(result, Int(abs(n-2*t)))
    }
    
    return result
}
