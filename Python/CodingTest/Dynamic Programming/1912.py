#1912 연속합
import sys

n = int(sys.stdin.readline())
dp = list(map(int, sys.stdin.readline().split()))

for i in range(1,n):
    dp[i] = max(dp[i], dp[i-1]+dp[i])

print(max(dp))