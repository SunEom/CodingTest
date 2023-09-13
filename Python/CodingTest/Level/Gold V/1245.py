#1245 농장 관리

import sys

n, m = map(int, sys.stdin.readline().split())

arr = []
visited = [[False for _ in range(m)] for _ in range(n)]
result = 0

for _ in range(n):
    arr.append(list(map(int, sys.stdin.readline().split())))

def bfs(r, c):
    visited[r][c] = True
    queue = [(r, c)]
    value = arr[r][c]
    direction = [(1, 0), (0, 1), (-1, 0), (0, -1), (1, 1),(-1, 1),(1, -1), (-1, -1)]
    top = True

    while len(queue) != 0 :
        pop = queue.pop(0)

        for d in direction:
            tr = pop[0] + d[0]
            tc = pop[1] + d[1]

            if (0<=tr<n) and (0<=tc<m):
                if value < arr[tr][tc]:
                    top = False
                elif arr[tr][tc] == value:
                    if visited[tr][tc] == False:
                        visited[tr][tc] = True
                        queue.append((tr, tc))

    return top

for r in range(0, n):
    for c in range(0, m):
        if visited[r][c] == False:
            if bfs(r, c):
                result += 1

print(result)
