import Foundation

var result = 0
var visited: [Bool]!

func bt(_ cnt: Int, _ remain: Int, _ dungeons: [[Int]]) {
    result = max(result, cnt)
    for i in 0..<visited.count {
        if !visited[i] && remain >= dungeons[i][0] {
            visited[i] = true
            bt(cnt+1, remain - dungeons[i][1], dungeons)
            visited[i] = false
        }
    }
}

func solution(_ k:Int, _ dungeons:[[Int]]) -> Int {
    visited = Array(repeating: false , count: dungeons.count)
    bt(0, k, dungeons)
    return result
}
