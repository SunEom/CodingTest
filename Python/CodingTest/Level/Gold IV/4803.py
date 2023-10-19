#4803 트리

import sys

def dfs(v):
    visited[v] = True
    stack = [(v, 0)]

    while stack:
        now, prev = stack.pop()

        for a in adjList[now]:
            if a == prev:
                continue
            elif not visited[a]:
                visited[a] = True
                stack.append((a, now))
            else:
                return 0

    return 1

idx = 1
while True:
    n, m = map(int, sys.stdin.readline().split())
    if n == 0 and m == 0:
        break

    result = 0
    visited = [False for _ in range(n+1)]
    adjList = [[] for _ in range(n+1)]

    for _ in range(m):
        a, b = map(int, sys.stdin.readline().split())
        adjList[a].append(b)
        adjList[b].append(a)

    for i in range(1, n+1):
        if not visited[i]:
            result += dfs(i)

    if result == 0:
        print(f"Case {idx}: No trees.")
    elif result == 1:
        print(f"Case {idx}: There is one tree.")
    else:
        print(f"Case {idx}: A forest of {result} trees.")

    idx += 1