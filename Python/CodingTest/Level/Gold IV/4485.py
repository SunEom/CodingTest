#4485 녹색 옷 입은 애가 젤다지?

import sys
import heapq

def dijkstra():
    dp[0][0] = arr[0][0]
    h = [(arr[0][0], 0, 0)]
    while h:
        nowCost, nr, nc = heapq.heappop(h)

        if nowCost > dp[nr][nc]:
            continue

        for dr, dc in directions:
            tr = nr + dr
            tc = nc + dc

            if 0<=tr<n and 0<=tc<n:
                newDist = nowCost + arr[tr][tc]

                if newDist < dp[tr][tc]:
                    dp[tr][tc] = newDist
                    heapq.heappush(h, (newDist, tr, tc))

directions = [(1,0),(0,1),(-1,0),(0,-1)]


i = 1
while True:
    n = int(sys.stdin.readline())
    if n == 0:
        break
    arr = [list(map(int, sys.stdin.readline().split())) for _ in range(n)]
    dp = [[sys.maxsize for _ in range(n)] for _ in range(n)]

    dijkstra()

    print(f"Problem {i}: {dp[n-1][n-1]}")
    i += 1
