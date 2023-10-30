#1520 내리막 길

import sys

n, m = map(int, sys.stdin.readline().split())

arr = [list(map(int, sys.stdin.readline().split())) for _ in range(n)]
dp = [[0 for _ in range(m)] for _ in range(n)]
directions = [(1,0), (0, 1), (-1,0), (0,-1)]

def dfs(r, c):
    if r == n-1 and c == m-1:
        return 1

    for dr, dc in directions:
        tr, tc = r + dr, c + dc
        if 0 <= tr < n and 0 <= tc < m and arr[tr][tc] < arr[r][c]:
            if dp[tr][tc] == 0:
                dp[tr][tc] = dfs(tr, tc)
            dp[r][c] += dp[tr][tc]

    return dp[r][c]

result = dfs(0,0)

print(result)