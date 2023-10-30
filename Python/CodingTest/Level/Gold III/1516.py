#1516 게임 개발

import sys

n = int(sys.stdin.readline())
time = [0 for _ in range(n+1)]
next = [[] for _ in range(n+1)]
remain = [0 for _ in range(n+1)]
queue = []

for i in range(1, n+1):
    li = list(map(int, sys.stdin.readline().split()))
    time[i] = li[0]
    for k in li[1:]:
        if k == -1:
            break
        next[k].append(i)
        remain[i] += 1
    if remain[i] == 0:
        queue.append(i)

dp = time.copy()
while queue:
    p = queue.pop(0)
    for v in next[p]:
        dp[v] = max(dp[v], time[v] + dp[p])
        remain[v] -= 1
        if remain[v] == 0:
            queue.append(v)

for n in dp[1:]:
    print(n)
