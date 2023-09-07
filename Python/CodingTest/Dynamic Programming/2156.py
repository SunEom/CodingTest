#2156 포도주 시식

import sys

n = int(sys.stdin.readline())
arr = [0]

for _ in range(0,n):
    arr.append(int(sys.stdin.readline()))

dp = [0 for _ in range(len(arr))]


if len(arr) > 1:
    dp[1] = arr[1]

if len(arr) > 2:
    dp[2] = arr[1] + arr[2]

for i in range(3, n+1):
    dp[i] = max(dp[i-2]+arr[i], dp[i-3]+arr[i-1]+arr[i], dp[i-1])

print(max(dp))