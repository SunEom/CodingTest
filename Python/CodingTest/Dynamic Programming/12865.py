#12865 배낭

import sys

n, k = map(int, sys.stdin.readline().split())
item = []
dp = [0 for _ in range(k+1)]

for _ in range(n):
    w, v = map(int, sys.stdin.readline().split())
    item.append((w,v))

for i in range(0, n):
    for j in range(k, item[i][0]-1, -1):
        dp[j] = max(dp[j], dp[j-item[i][0]] + item[i][1])

print(dp[-1])
