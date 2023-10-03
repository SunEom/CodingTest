#15989 1, 2, 3 더하기 4

import sys

t = int(sys.stdin.readline())
for _ in range(t):
    n = int(sys.stdin.readline())
    dp = [0 for _ in range(n+1)]
    if n <= 3:
        print(n)
    else:
        dp[0] = 1
        for j in range(1,4):
            for i in range(j, n+1):
                dp[i] += dp[i-j]

        print(dp[-1])
