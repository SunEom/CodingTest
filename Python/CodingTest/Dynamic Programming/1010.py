#1010 다리 놓기

# from itertools import combinations
# import sys
# t = int(sys.stdin.readline())
#
# result = ""
# for _ in range(0,t):
#     n, m = map(int, sys.stdin.readline().split())
#     result += f"{len(list(combinations(range(0,m),n)))}\n"
#
# print(result)

import sys

t = int(sys.stdin.readline())

result = ""
dp = [[0 for _ in range(31)]for _ in range(31)]

for i in range(0,31):
    for j in range(0,i+1):
        if i == j or j == 0:
            dp[i][j] = 1
            continue
        dp[i][j] = dp[i-1][j-1] + dp[i-1][j]

for _ in range(0,t):
    n,m = map(int, sys.stdin.readline().split())
    result += f"{dp[m][n]}\n"

print(result)