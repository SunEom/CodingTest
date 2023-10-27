#12851 숨바꼭질2

import sys

n, k = map(int, sys.stdin.readline().split())

dp = [sys.maxsize for _ in range(200001)]
kcnt = 0
ktime = sys.maxsize


queue = [(n, 0)]

dp[n] = 0

idx = 0
while len(queue) > idx:
    now, time = queue[idx]

    if ktime < time:
        break

    if now == k:
        ktime = time
        kcnt += 1

    if now + 1 < 200000 and dp[now+1] >= dp[now] + 1:
        dp[now + 1] = dp[now] + 1
        queue.append((now+1, time+1))

    if now - 1 >= 0 and dp[now - 1] >= dp[now] + 1:
        dp[now - 1] = dp[now] + 1
        queue.append((now-1, time+1))

    if now * 2 < 200000 and dp[now*2] >= dp[now] + 1:
        dp[now * 2] = dp[now] + 1
        queue.append((now*2, time+1))

    idx += 1

print(ktime)
print(kcnt)
