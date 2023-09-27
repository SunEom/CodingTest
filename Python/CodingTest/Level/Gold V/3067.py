#3067 Coins

import sys

t = int(sys.stdin.readline())

for _ in range(t):
    n = int(sys.stdin.readline())
    coins = list(map(int, sys.stdin.readline().split()))
    m = int(sys.stdin.readline())
    dp = [0 for _ in range(m+1)]
    dp[0] = 1

    for coin in coins:
        for i in range(coin, m+1):
            dp[i] += dp[i-coin]

    print(dp[m])