import Foundation

func solution(_ n:Int, _ edge:[[Int]]) -> Int {
    var visited = Array(repeating: false, count: n+1)
    var cnt = 0
    var maxDist = 0
    var adjList = Array(repeating:[Int](), count: n+1)
    
    visited[1] = true
    
    for e in edge {
        adjList[e[0]].append(e[1])
        adjList[e[1]].append(e[0])
    }
    
    var queue = [[1, 0]]
    
    while queue.count > 0 {
        let t = queue.removeFirst()
        let p = t[0], dis = t[1]
        
        for v in adjList[p] {
            if !visited[v] {
                visited[v] = true
                queue.append([v, dis+1])
                
                if maxDist == dis + 1 {
                    cnt += 1
                } else if maxDist < dis + 1 {
                    maxDist = dis + 1
                    cnt = 1
                }
            }
        }
    }
    
    return cnt
}
