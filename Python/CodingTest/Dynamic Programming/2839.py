#2839 설탕배달

import sys

n = int(sys.stdin.readline())
MAX = 999999
dp = [MAX] * (n+1)

dp[0] = 0

for i in range(3, n+1):
    if i >= 3:
        dp[i] = min(dp[i], dp[i-3] + 1)

    if i >= 5:
        dp[i] = min(dp[i], dp[i - 5] + 1)

if dp[n] == MAX:
    print(-1)
else:
    print(dp[n])
