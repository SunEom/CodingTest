#12865 평범한 배낭

import sys

n, k = map(int, sys.stdin.readline().split())

items = []

dp = [0 for _ in range(k+1)]

for _ in range(n):
    w, v = map(int, sys.stdin.readline().split())
    items.append((w, v))

for item in items:
    for i in range(k, item[0]-1, -1):
        dp[i] = max(dp[i], dp[i-item[0]] + item[1])

print(dp[-1])