#2775  부녀회장이 될테야

import sys

t = int(sys.stdin.readline())
result = ""
for _ in range(0, t):
    k = int(sys.stdin.readline())
    n = int(sys.stdin.readline())
    dp = [[0 for _ in range(n+1)] for _ in range(k+1)]
    dp[0] = list(range(n+1))
    for i in range(1, k+1):
        for j in range(1,n+1):
            dp[i][j] = dp[i-1][j] + dp[i][j-1]
    result += f"{dp[k][n]}\n"


print(result)