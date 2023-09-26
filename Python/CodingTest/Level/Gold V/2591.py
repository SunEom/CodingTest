#2591 숫자카드

import sys

arr = list(map(int, list(sys.stdin.readline().strip())))
dp = [0 for _ in range(len(arr))]
if arr[-1] > 0:
    dp[-1] = 1
dp.append(1)

for i in range(len(arr)-2, -1, -1):
    if arr[i] > 0 :
        dp[i] += dp[i+1]
        if arr[i]*10 + arr[i+1] <= 34:
            dp[i] += dp[i+2]

print(dp[0])