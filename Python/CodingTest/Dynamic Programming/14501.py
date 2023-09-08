#14501 퇴사

import sys

n = int(sys.stdin.readline())
t = [0 for _ in range(n+2)]
v = [0 for _ in range(n+2)]
dp = [0 for _ in range(n+2)]

for i in range(1,n+1):
    a, b = map(int, sys.stdin.readline().split())
    t[i] = a
    v[i] = b

for i in range(1,n+1):
    for j in range(i + t[i] , n+2):
        dp[j] = max(dp[j], dp[i] + v[i])

print(dp[-1])