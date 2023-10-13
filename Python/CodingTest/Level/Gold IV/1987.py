#1987 알파벳

import sys

visited = [False for _ in range(91)]
r, c = map(int, sys.stdin.readline().split())

arr = [list(sys.stdin.readline().strip()) for _ in range(r)]

directions = [(1,0),(0,1),(-1,0),(0,-1)]
result = 0
def bt(p, q, d):
    global result
    visited[ord(arr[p][q])] = True
    result = max(result, d)

    for dr, dc in directions:
        tr, tc = p + dr, q + dc
        if 0 <= tr < r and 0 <= tc < c and not visited[ord(arr[tr][tc])]:
            bt(tr, tc, d+1)
            visited[ord(arr[tr][tc])] = False

bt(0,0,1)
print(result)
