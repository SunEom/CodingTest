#2589 보물섬

import sys
r, c  = map(int, sys.stdin.readline().split())
arr = [list(sys.stdin.readline().strip()) for _ in range(r)]

def bfs(sr, sc):
    if arr[sr][sc] == "W":
        return 0
    visited = [[ False for _ in range(c)] for _ in range(r)]
    visited[sr][sc] = True
    queue = [(sr, sc, 0)]
    direction = [(0,1),(1,0),(0,-1),(-1,0)]
    maxLen = 0

    while len(queue) != 0:
        pr, pc, pd = queue.pop(0)
        for d in direction:
            tr = pr + d[0]
            tc = pc + d[1]
            if 0 <= tr < r and 0 <= tc < c and visited[tr][tc] == False and arr[tr][tc] == "L":
                visited[tr][tc] = True
                queue.append((tr, tc, pd + 1))
                if pd+1 > maxLen:
                    maxLen = pd+1
    return maxLen

result = 0

for i in range(r):
    for j in range(c):
        result = max(result, bfs(i,j))

print(result)
