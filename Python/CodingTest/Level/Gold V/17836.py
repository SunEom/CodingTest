#17836 공주님을 구해라!

import sys

n, m, t = map(int, sys.stdin.readline().split())

arr = []
visited = [[sys.maxsize for _ in range(m)] for _ in range(n)]
directions = [(1,0),(0,1),(-1,0),(0,-1)]
for _ in range(n):
    arr.append(list(map(int, sys.stdin.readline().split())))
queue = [(0,0)]

visited[0][0] = 0
while queue:
    r, c = queue.pop(0)
    if visited[r][c] > t:
        break
    if r == n-1 and c == m-1:
        break
    if arr[r][c] == 2:
        dis = abs(n - 1 - r) + abs(m - 1 - c)
        visited[n-1][m-1] = min(visited[n-1][m-1], visited[r][c] + dis)

    for dr, dc in directions:
        tr, tc = r+dr, c+dc
        if tr in range(0,n) and tc in range(0, m) and visited[tr][tc] > visited[r][c] + 1:
            if arr[tr][tc] != 1:
                visited[tr][tc] = visited[r][c] + 1
                queue.append((tr, tc))

if visited[n - 1][m - 1] > t:
    print("Fail")
else:
    print(visited[n - 1][m - 1])


