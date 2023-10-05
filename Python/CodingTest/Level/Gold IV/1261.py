#1261 알고스팟

import sys

m, n = map(int, sys.stdin.readline().split())

visited = [[sys.maxsize for _ in range(m)] for _ in range(n)]
visited[0][0] = 0

arr = []

for _ in range(n):
    arr.append(list(map(int, list(sys.stdin.readline().strip()))))

queue = [(0,0)]
directions = [(1,0),(0,1),(-1,0),(0,-1)]
while queue:
    pr, pc = queue.pop(0)

    for dr, dc in directions:
        tr = dr + pr
        tc = dc + pc

        if tr in range(0, n) and tc in range(0, m):
            if arr[tr][tc] == 1 and visited[tr][tc] > visited[pr][pc] + 1:
                visited[tr][tc] = visited[pr][pc] + 1
                queue.append((tr, tc))

            if arr[tr][tc] == 0 and visited[tr][tc] > visited[pr][pc]:
                visited[tr][tc] = visited[pr][pc]
                queue.append((tr, tc))


print(visited[n-1][m-1])

