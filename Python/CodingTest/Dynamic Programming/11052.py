#11052 카드 구매하기

import sys

n = int(sys.stdin.readline())

arr = [0] + list(map(int, sys.stdin.readline().split()))

dp = [0 for _ in range(n+1)]

for i in range(1,n+1):
    for j in range(i, n+1, 1):
        dp[j] = max(dp[j], dp[j-i] + arr[i])

print(dp[n])