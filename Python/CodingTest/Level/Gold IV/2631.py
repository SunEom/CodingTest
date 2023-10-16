#2631 줄 세우기

import sys

n = int(sys.stdin.readline())
arr = [int(sys.stdin.readline()) for _ in range(n)]

dp = [1 for _ in range(n)]
result = 1

for i in range(1, n):
    for j in range(0, i):
        if arr[i] > arr[j]:
            dp[i] = max(dp[i], dp[j] + 1)
            result = max(result, dp[i])

print(n - result)