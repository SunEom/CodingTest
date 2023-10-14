#1958 LCS 3

import sys

s1 = sys.stdin.readline().strip()
s2 = sys.stdin.readline().strip()
s3 = sys.stdin.readline().strip()

a, b, c = len(s1), len(s2), len(s3)

dp = [[[0 for _ in range(c+1)] for _ in range(b+1)] for _ in range(a+1)]
result = 0

for i in range(1, a+1):
    for j in range(1, b+1):
        for k in range(1, c+1):
            if s1[i-1] == s2[j-1] and s2[j-1] == s3[k-1]:
                dp[i][j][k] = dp[i-1][j-1][k-1] + 1
            else:
                dp[i][j][k] = max(dp[i-1][j][k], dp[i][j-1][k], dp[i][j][k-1])
            result = max(result, dp[i][j][k])

print(result)


