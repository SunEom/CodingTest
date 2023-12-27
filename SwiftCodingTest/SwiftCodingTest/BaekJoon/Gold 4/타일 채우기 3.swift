import Foundation

let n = Int(String(readLine()!))!

var dp = Array(repeating: 0, count: 1_000_001)
var s = Array(repeating: 0, count: 1_000_001)

dp[0] = 1
dp[1] = 2
dp[2] = 7

s[0] = 1
s[1] = 3
s[2] = 10

for i in stride(from: 3, through: n , by: 1) {
    dp[i] = (2*dp[i-1] + 3*dp[i-2] + 2*s[i-3])%1000000007
    s[i] = s[i-1] + dp[i]
}

print(dp[n])
