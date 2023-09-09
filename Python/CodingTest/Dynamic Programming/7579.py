#7579 앱
import sys

n, m = map(int, sys.stdin.readline().split())
memory = list(map(int, sys.stdin.readline().split()))
cost = list(map(int, sys.stdin.readline().split()))
dp = [0 for _ in range(sum(cost)+1)]

for i in range(n):
    for j in range(len(dp)-1, cost[i]-1, -1):
        dp[j] = max(dp[j], dp[j-cost[i]] + memory[i])

for i in range(0, len(dp)):
    if dp[i] >= m:
        print(i)
        break
