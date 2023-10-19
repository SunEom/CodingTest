# 4781 사탕 가게

import sys

while True:
    temp = list(map(float, sys.stdin.readline().split()))
    n, m = int(temp[0]), int(float(temp[1]) * 100)
    dp = [0 for _ in range(m + 1)]
    arr = []
    if n == 0 and m == 0.00:
        break

    for _ in range(n):
        temp2 = list(map(float, sys.stdin.readline().split()))
        cal, cost = int(temp2[0]), int(float(temp2[1]) * 100 + 0.5)
        arr.append((cost, cal))

    for cost, cal in arr:
        for k in range(cost, m + 1):
            dp[k] = max(dp[k], dp[k - cost] + cal)

    print(dp[m])