#2636 치즈

import sys

n, m = map(int, sys.stdin.readline().split())

arr = [list(map(int, sys.stdin.readline().split())) for _ in range(n)]
result = 0
time = 0
def melt():
    queue = [(0,0)]
    directions = [(1,0),(0,1),(-1,0),(0,-1)]
    visited = [[False for _ in range(m)] for _ in range(n)]
    visited[0][0] = True

    cnt = 0

    while queue:
        pr, pc = queue.pop(0)
        for dr, dc in directions:
            tr = pr + dr
            tc = pc + dc
            if 0<=tr<n and 0<=tc<m and not visited[tr][tc]:
                if arr[tr][tc] == 0:
                    queue.append((tr, tc))
                    visited[tr][tc] = True
                else:
                    visited[tr][tc] = True
                    arr[tr][tc] = 0
                    cnt += 1

    return cnt

while True:
    temp = melt()

    if temp == 0:
        break
    time += 1
    result = temp

print(time)
print(result)