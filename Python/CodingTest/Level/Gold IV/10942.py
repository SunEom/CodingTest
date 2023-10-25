#10942 펠린드롬?

import sys

n = int(sys.stdin.readline())
arr = [0] + list(map(int, sys.stdin.readline().split()))
case = []
t = int(sys.stdin.readline())

for _ in range(t):
    a,b = map(int, sys.stdin.readline().split())
    case.append((a,b))

dp = [[-1 for _ in range(n+1)] for _ in range(n+1)]

for i in range(1,n+1):
    dp[i][0] = 1

for distance in range(1, n):
    for start in range(1, n+1-distance):
        if arr[start] != arr[start + distance]:
            dp[start][distance] = 0
        else:
            left = start + 1
            right = start + distance -1

            if left > right:
                dp[start][distance] = 1
            else:
                dp[start][distance] = dp[left][distance-2]

for c in case:
    print(dp[c[0]][c[1]-c[0]])