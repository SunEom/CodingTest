import Foundation

var visited = [[Bool]]()
var result = Int.max
var dp = [[[[Int]]]]()
let directions = [[1, 0], [0, 1], [-1, 0], [0, -1]]

func bt(_ n: Int, _ now:[Int], _ prevDirection: [Int], _ cost: Int, _ board: [[Int]]) {
    if now == [n-1, n-1] {
        result = min(result, cost)
        return
    }
    
    if dp[now[0]][now[1]][prevDirection[0]+1][prevDirection[1]+1] <= cost {
        return
    } else {
        dp[now[0]][now[1]][prevDirection[0]+1][prevDirection[1]+1] = cost
    }
    
    for d in directions {
        let tr = now[0] + d[0], tc = now[1] + d[1]
        
        if (0..<n).contains(tr) && (0..<n).contains(tc) && !visited[tr][tc] && board[tr][tc] == 0  {
            visited[tr][tc] = true
            if d == prevDirection {
                bt(n, [tr, tc], d, cost+100, board)
            } else {
                bt(n, [tr, tc], d, cost+600, board)
            }
            visited[tr][tc] = false
        }
    }
}

func solution(_ board:[[Int]]) -> Int {
    visited = board.map{ $0.map { _ in false } }
    let n = board.count
    dp = Array(repeating: Array(repeating: Array(repeating: Array(repeating: Int.max, count: 3), count:3), count: n), count: n)
    
    bt(n, [0, 0], [0,1], 0, board)
    bt(n, [0, 0], [1, 0], 0, board)
    
    return result
}
