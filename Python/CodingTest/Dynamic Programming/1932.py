#1932 정수 삼각형

import sys

n = int(sys.stdin.readline())

dp = []

for _ in range(0, n):
    dp.append([0] + list(map(int, sys.stdin.readline().split())) + [0])

for i in range(1,n):
    for j in range(1, len(dp[i])-1):
        dp[i][j] += max(dp[i-1][j-1], dp[i-1][j])

print(max(dp[-1]))