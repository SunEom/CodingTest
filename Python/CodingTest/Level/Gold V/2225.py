#2225 합분해

import sys

n, k = map(int, sys.stdin.readline().split())

dp = [[0 for _ in range(n+1)] for _ in range(k+1)]
dp[1] = [1 for _ in range(n+1)]
for i in range(2, k+1):
    for j in range(0, n+1):
        dp[i][j] = (dp[i][j-1] + dp[i-1][j])%1000000000

print(dp[k][n]%1000000000)