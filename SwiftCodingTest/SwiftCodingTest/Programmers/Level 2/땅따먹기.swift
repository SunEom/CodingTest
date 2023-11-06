import Foundation

func solution(_ land:[[Int]]) -> Int{
    var answer = 0
    var dp = land
    
    for i in 1..<dp.count {
        for j in 0..<4 {
            var temp = 0
            for k in 0..<4 {
                if k == j {
                    continue
                }
                temp = max(temp, dp[i-1][k])
            }
            dp[i][j] += temp
        }
    }

    return dp.last!.max()!
}
