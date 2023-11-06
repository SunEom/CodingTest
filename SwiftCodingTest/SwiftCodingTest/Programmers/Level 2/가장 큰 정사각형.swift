import Foundation

func solution(_ board:[[Int]]) -> Int
{
    var answer:Int = 0
    let r = board.count
    let c = board[0].count
    if r == 1 || c == 1 {
        return 1
    }
    var dp = Array(repeating: Array(repeating:0, count: c), count: r)
    
    for i in 0..<r {
        dp[i][0] = board[i][0]
    }
    
    for i in 0..<c {
        dp[0][i] = board[0][i]
    }
    
    for i in 1..<r{
        for j in 1..<c {
            if board[i][j] == 1 {
                dp[i][j] = min(dp[i-1][j-1], dp[i][j-1], dp[i-1][j])+1
                
                if answer < dp[i][j]*dp[i][j] {
                    answer = dp[i][j]*dp[i][j]
                }
            }
        }
    }

    return answer
}
