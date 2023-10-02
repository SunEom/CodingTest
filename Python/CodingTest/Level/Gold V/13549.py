#13549 숨바꼭질 3

import sys

n, k = map(int, sys.stdin.readline().split())
dp = [sys.maxsize for _ in range(100001)]

dp[n] = 0

queue = [n]

while queue:
    p = queue.pop(0)

    if 0<= p*2 <= 100000:
        if dp[p*2] > dp[p]:
            dp[p*2] = dp[p]
            queue.append(p*2)

    if 0<= p-1 <= 100000:
        if dp[p-1] > dp[p] + 1:
            dp[p - 1] = dp[p] + 1
            queue.append(p-1)

    if 0<= p+1 <= 100000:

        if dp[p + 1] > dp[p] + 1:
            dp[p + 1] = dp[p] + 1
            queue.append(p+1)

print(dp[k])

