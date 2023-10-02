#14503 로봇 청소기

import sys

n, m = map(int, sys.stdin.readline().split())

arr = []
result = 0
directions = [[(0,-1),(1,0),(0,1),(-1,0)], [(-1,0),(0,-1),(1,0),(0,1)], [(0,1),(-1, 0),(0,-1),(1,0)], [(1,0), (0, 1),(-1, 0),(0,-1)]]
back = [(1,0),(0,-1),(-1, 0),(0,1)]
pos = {(-1,0):0, (0,1):1, (1,0):2, (0,-1):3}

nr, nc, np = map(int, sys.stdin.readline().split())

for _ in range(n):
    arr.append(list(map(int, sys.stdin.readline().split())))

while True:
    if arr[nr][nc] == 0:
        arr[nr][nc] = 2
        result += 1

    dirty = False
    for (dr, dc) in directions[np]:
        tr = nr + dr
        tc = nc + dc

        if 0 <= tr <= n and 0 <= tc <= m and arr[tr][tc] == 0:
            nr = tr
            nc = tc
            np = pos[(dr, dc)]
            dirty = True
            break
    if dirty:
        continue

    br = back[np][0] + nr
    bc = back[np][1] + nc

    if 0 <= br <= n and 0 <= bc <= m and arr[br][bc] != 1:
        nr, nc = br, bc
        continue
    else:
        break

print(result)




