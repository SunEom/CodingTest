#2293 동전 1
import sys

n, k = map(int, sys.stdin.readline().split())

dp = [0 for _ in range(k+1)]
coins = [int(sys.stdin.readline()) for _ in range(n)]
dp[0] = 1
for i in range(coins[0], k+1, coins[0]):
    dp[i] = 1

for i in range(1, n):
    for j in range(coins[i], k+1):
        dp[j] += dp[j-coins[i]]

print(dp[k])