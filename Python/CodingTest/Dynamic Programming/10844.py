#10844 쉬운 계단 수

import sys

n = int(sys.stdin.readline())

dp = [[1 for _ in range(10)] for _ in range(101)]
dp[1][0] = 0

for i in range(2, n+1):
    for j in range(0, 10):
        if j == 0:
            dp[i][j] = dp[i-1][j+1]
        elif j == 9:
            dp[i][j] = dp[i-1][j-1]
        else:
            dp[i][j] = dp[i-1][j-1] + dp[i-1][j+1]

print(sum(dp[n])%1000000000)