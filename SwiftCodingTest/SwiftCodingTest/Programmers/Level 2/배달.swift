import Foundation

func solution(_ N:Int, _ road:[[Int]], _ k:Int) -> Int {
    var answer = 0
    var adjList = Array(repeating:[[Int]](), count: N+1)
    var distance = Array(repeating: Int.max, count: N+1)
    distance[1] = 0
    
    for r in road {
        adjList[r[0]].append([r[1],r[2]])
        adjList[r[1]].append([r[0],r[2]])
    }
    
    var queue = [1]
    
    while queue.count > 0 {
        let p = queue.removeFirst()
        
        for a in adjList[p] {
            let v = a[0], d = a[1]
            if distance[p] + d < distance[v] {
                distance[v] = distance[p] + d
                queue.append(v)
            }
        }
    }
    
    for d in distance[1...] {
        if d <= k {
            answer += 1
        }
    }
    return answer
}
