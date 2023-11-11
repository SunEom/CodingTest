import Foundation

var visited: [Bool]!
var result: [String]?

func dfs(_ n: Int, _ now: String,_ course: [String],_ tickets:[[String]]) {
    if n == visited.count {
        result = course
    }
    
    if result != nil {
        return
    }
    
    for i in 0..<visited.count {
        if !visited[i] && tickets[i][0] == now {
            visited[i] = true
            let tcourse = course + [tickets[i][1]]
            dfs(n+1, tickets[i][1], tcourse, tickets)
            visited[i] = false
        }
    }
}

func solution(_ tickets:[[String]]) -> [String] {
    
    var adjList = [String: [String]]()
    visited = Array(repeating: false, count: tickets.count)
    
    let tickets = tickets.sorted { $0[1] < $1[1] }

    dfs(0, "ICN", ["ICN"], tickets)
    
    return result!
}
