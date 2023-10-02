#13023 ABCDE

import sys

n, m = map(int, sys.stdin.readline().split())

edges = [[]for _ in range(n)]
visited = [False] * n
answer = False

for _ in range(m):
    a, b = map(int, sys.stdin.readline().split())
    edges[a].append(b)
    edges[b].append(a)

def dfs(i, d):
    global answer
    visited[i] = True

    if d == 4:
        answer = True
        return

    for k in edges[i]:
        if not visited[k]:
            visited[k] = True
            dfs(k, d+1)
            visited[k] = False

for j in range(n):
    dfs(j, 0)
    visited[j] = False
    if answer:
        break

if answer:
    print(1)
else:
    print(0)