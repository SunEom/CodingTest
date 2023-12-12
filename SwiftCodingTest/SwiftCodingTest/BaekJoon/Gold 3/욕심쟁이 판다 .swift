import Foundation

let n = Int(readLine()!)!
var arr = [[Int]]()
var result = 0

for _ in 0..<n {
    arr.append(readLine()!.split(separator:" ").map { Int(String($0))! })
}

var visited = Array(repeating: Array(repeating: false, count: n), count: n)
var dp = Array(repeating: Array(repeating: 1, count: n), count: n)

func dfs(_ r: Int, _ c: Int) {
    let directions = [[1, 0], [0, 1], [-1, 0], [0, -1]]
    
    for d in directions {
        let tr = r + d[0], tc = c + d[1]
        
        if (0..<n).contains(tr) && (0..<n).contains(tc) {
            if arr[r][c] < arr[tr][tc] {
                if !visited[tr][tc] {
                    visited[tr][tc] = true
                    dfs(tr, tc)
                }
                dp[r][c] = max(dp[r][c], 1 + dp[tr][tc])
            }
        }
    }
    
    result = max(result, dp[r][c])
}

for i in 0..<n {
    for j in 0..<n {
        if visited[i][j] == false {
            dfs(i, j)
        }
    }
}

print(result)
