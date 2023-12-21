import Foundation

let n = Int(readLine()!)!
var dp = [1, 1]
    
for i in 2...30 {
    dp.append(dp[i-1] + dp[i-2] * 2)
}

if(n % 2 == 1) {
    print((dp[n] + dp[(n-1)/2])/2)
}
else {
    print((dp[n] + dp[n/2] + dp[n/2 - 1] * 2)/2)
}
