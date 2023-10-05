#1405 미친로봇

import sys

n, E, W, S, N = map(int, sys.stdin.readline().split())

possibilities = [E/100.0, W/100.0, S/100.0, N/100.0]
result = 0

visited = [[False for _ in range(2*n+1)] for _ in range(2*n+1) ]
def bt(nr, nc, num, p):
    global result
    directions = [(0,1),(0,-1),(1,0),(-1,0)]
    visited[nr][nc] = True
    if num == n:
        result += p
        return

    for i in range(4):
        dr, dc = directions[i]

        tr = dr + nr
        tc = dc + nc

        if possibilities[i] != 0 and not visited[tr][tc]:
            bt(tr, tc, num+1, p*possibilities[i])
            visited[tr][tc] = False

bt(n,n,0,1)

print(result)


