#1967 트리의 지름

import sys

n = int(sys.stdin.readline())

edges = [[] for _  in range(n+1)]

for _ in range(n-1):
    a, b, c = map(int, sys.stdin.readline().split())
    edges[a].append((b,c))
    edges[b].append((a,c))

def dfs(s):
    visited = [False] * (n+1)
    visited[s] = True
    stack = [(s, 0)]
    r = 0
    vt = s

    while stack:
        v, c = stack.pop()
        if r < c:
            r = c
            vt = v


        for vertex, distance in edges[v]:
            if not visited[vertex]:
                visited[vertex] = True
                stack.append((vertex, c + distance))

    return vt, r

if n > 1:
    p, q = dfs(edges[1][0][0])

    _, result = dfs(p)

    print(result)
else:
    print(0)