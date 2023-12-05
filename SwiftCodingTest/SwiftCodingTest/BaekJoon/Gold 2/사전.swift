import Foundation

let nmk = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = nmk[0], m = nmk[1]
var k = nmk[2]

var dp = Array(repeating: Array(repeating: 1, count: m+1), count: n+1)

for i in 1...n {
    for j in 1...m {
        let value = dp[i-1][j] + dp[i][j-1] > 1_000_000_000 ? 1_000_000_000 : dp[i-1][j] + dp[i][j-1]
        dp[i][j] = value
    }
}

if dp[n][m] < k {
    print(-1)
} else {
    var result = ""
    var acnt = n
    var zcnt = m
    for _ in 0..<n+m {
        if acnt == 0 {
            result += "z"
            zcnt -= 1
            continue
        }
        
        if zcnt == 0 {
            result += "a"
            acnt -= 1
            continue
        }
        
        let temp = dp[acnt-1][zcnt]
        
        if temp >= k {
            acnt -= 1
            result += "a"
        } else {
            k -= temp
            zcnt -= 1
            result += "z"
        }
    }
    print(result)
}
