#2748 피보나치 수 2

import sys

n = int(sys.stdin.readline())

dp = [0,1]

while len(dp) <= n:
    dp.append(dp[-1] + dp[-2])

print(dp[n])