import Foundation

let n = Int(readLine()!)!
var dp = Array(repeating: Array(repeating: Array(repeating: 0, count: 3), count: 2), count: n+1)
let mod = 1_000_000

dp[1][0][0] = 1
dp[1][1][0] = 1
dp[1][0][1] = 1

for i in stride(from: 2, through: n, by: 1) {
    dp[i][0][0] = (dp[i-1][0][0] + dp[i-1][0][1] + dp[i-1][0][2]) % mod
    dp[i][0][1] = dp[i-1][0][0] % mod
    dp[i][0][2] = dp[i-1][0][1] % mod
    dp[i][1][0] = (dp[i-1][0][0] + dp[i-1][0][1] + dp[i-1][0][2] + dp[i-1][1][0] + dp[i-1][1][1] + dp[i-1][1][2]) % mod
    dp[i][1][1] = dp[i-1][1][0] % mod
    dp[i][1][2] = dp[i-1][1][1] % mod
}

var result = (dp[n][0][0] + dp[n][0][1] + dp[n][0][2] + dp[n][1][0] + dp[n][1][1] + dp[n][1][2]) % mod

print(result)
