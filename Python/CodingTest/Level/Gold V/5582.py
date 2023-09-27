#5582 공통 부분 문자열

import sys

a = "" + sys.stdin.readline().strip()
b = "" + sys.stdin.readline().strip()

dp = [[0 for _ in range(len(b)+1)] for _ in range(len(a)+1)]
result = 0
for i in range(1,len(a)+1):
    for j in range(1, len(b)+1):
        if a[i-1] == b[j-1]:
            dp[i][j] = dp[i-1][j-1] + 1
            result = max(result, dp[i][j])

print(result)