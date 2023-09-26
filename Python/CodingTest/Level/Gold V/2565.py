#2565 전깃줄

import sys
n = int(sys.stdin.readline())
arr = [list(map(int, sys.stdin.readline().split())) for _ in range(n)]
arr.sort(key=lambda x: x[0])
dp = [1 for _ in range(n)]
for i in range(n):
    for j in range(0, i):
        if arr[i][1] > arr[j][1] :
            dp[i] = max(dp[i], dp[j]+1)

print(n - max(dp))