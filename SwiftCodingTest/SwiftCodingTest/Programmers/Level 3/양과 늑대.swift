import Foundation

func solution(_ info:[Int], _ edges:[[Int]]) -> Int {
    var adjList = Array(repeating: [Int](), count: info.count)
    var result = 1
    for edge in edges {
        adjList[edge[0]].append(edge[1])
    }
    
    func bt(_ available: [Int],_ p : [Int]) {
        
        if result < p[0] {
            result = p[0]
        }
        
        for i in 0..<available.count {
            var t = available
            if info[available[i]] == 0 {
                t.remove(at: i)
                bt(t + adjList[available[i]], [p[0]+1, p[1]])
            } else {
                if p[0] > p[1] + 1 {
                    t.remove(at: i)
                    bt(t + adjList[available[i]], [p[0], p[1] + 1])
                }
            }
        }
    }
    
    bt(adjList[0], [1, 0])
    
    return result
}
