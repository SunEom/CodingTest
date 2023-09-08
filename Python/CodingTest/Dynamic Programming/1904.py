# 1904 01타일

import sys

n = int(sys.stdin.readline())

dp = [0, 1, 2]

while len(dp) <= n :
    dp.append((dp[-1]+dp[-2])%15746)

print(dp[n])