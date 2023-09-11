#1106 호텔

import sys

c, n = map(int, sys.stdin.readline().split())
dp = [0 for _ in range(100001)]

items = []

for _ in range(n):
    cost, customer = map(int, sys.stdin.readline().split())
    items.append((cost, customer))

for item in items:
    for i in range(item[0], len(dp)):
        dp[i] = max(dp[i], dp[i-item[0]] + item[1])

for i in range(len(dp)):
    if dp[i] >= c:
        print(i)
        break