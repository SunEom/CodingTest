#1915 가장 큰 정사각형

import sys

n, m = map(int, sys.stdin.readline().split())

arr = [list(map(int, list(sys.stdin.readline().strip()))) for _ in range(n)]

dp = [[0 for _ in range(m) ] for _ in range(n) ]

result = 0

for i in range(m):
    if arr[0][i] == 1:
        dp[0][i] = arr[0][i]
        result = 1

for i in range(n):
    if arr[i][0] == 1:
        dp[i][0] = arr[i][0]
        result = 1

for i in range(1, n):
    for j in range(1, m):
        if arr[i][j] == 0 :
            continue

        dp[i][j] = min(dp[i-1][j-1], dp[i-1][j], dp[i][j-1]) + 1

        result = max(result, dp[i][j]**2)

print(result)