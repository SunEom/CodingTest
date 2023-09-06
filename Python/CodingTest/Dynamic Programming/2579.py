#2579 계단 오르기
import sys
n = int(sys.stdin.readline())

stairs = [0]

for _ in range(0, n):
    stairs.append(int(sys.stdin.readline()))

dp = [0] * (n+1)

if n >= 1 :
    dp[1] = stairs[1]
if n >= 2 :
    dp[2] = stairs[1] + stairs[2]

for i in range(3, n+1):
    dp[i] = stairs[i] + max(dp[i-2], dp[i-3]+stairs[i-1])

print(dp[n])
