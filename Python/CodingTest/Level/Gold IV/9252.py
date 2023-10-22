#9252 LCS 2

import sys
s1 = " " + sys.stdin.readline().rstrip()
s2 = " " + sys.stdin.readline().rstrip()

dp = [["" for _ in range(len(s2))] for _ in range(len(s1))]

result = ""

for i in range(1, len(s1)):
    for j in range(1, len(s2)):
        if s1[i] == s2[j]:
            dp[i][j] = dp[i-1][j-1] + s1[i]
        else:
            if len(dp[i][j-1]) > len(dp[i-1][j]):
                dp[i][j] = dp[i][j-1]
            else:
                dp[i][j] = dp[i-1][j]

print(len(dp[-1][-1]))
print(dp[-1][-1])