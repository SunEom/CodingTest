import Foundation

func solution(_ n:Int, _ roads:[[Int]], _ sources:[Int], _ destination:Int) -> [Int] {
    var adjList = Array(repeating: [Int](), count: n+1)
    
    for road in roads {
        adjList[road[0]].append(road[1])
        adjList[road[1]].append(road[0])
    }
    
    func bfs(_ s: Int) -> [Int] {
        var visited = Array(repeating: false, count: n+1)
        var distances = Array(repeating:-1, count: n+1)
        distances[s] = 0
        visited[s] = true
        
        var queue = [[s,0]]
        var idx = 0
        while queue.count > idx {
            let p = queue[idx]
            let v = p[0], dist = p[1]
            
            for k in adjList[v] {
                if visited[k] == false {
                    visited[k] = true
                    distances[k] = dist+1
                    queue.append([k, dist+1])
                }
            }
            idx += 1
        }
        
        return distances
    }
    
    let d = bfs(destination)
    
    return sources.map { d[$0] }
}
