#2665 미로만들기

import sys

n = int(sys.stdin.readline())
arr = [list(map(int, list(sys.stdin.readline().strip()))) for _ in range(n)]
dp = [[sys.maxsize for _ in range(n)] for _ in range(n)]

def bfs():
    queue = [(0,0)]
    dp[0][0] = 0
    directions = [(1,0),(0,1),(-1,0),(0,-1)]

    while queue:
        pr, pc = queue.pop(0)

        for dr, dc in directions:
            tr = pr + dr
            tc = pc + dc

            if 0<=tr<n and 0<=tc<n:
                if arr[tr][tc] == 0:
                    if dp[tr][tc] > dp[pr][pc] + 1:
                        dp[tr][tc] = dp[pr][pc] + 1
                        queue.append((tr, tc))
                else:
                    if dp[tr][tc] > dp[pr][pc]:
                        dp[tr][tc] = dp[pr][pc]
                        queue.append((tr, tc))

bfs()

print(dp[n-1][n-1])

