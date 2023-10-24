#10282 해킹

import sys
import heapq

t = int(sys.stdin.readline())

def dijkstra(n, v):
    distance = [sys.maxsize for _ in range(n+1)]
    distance[v] = 0
    heap = [(0, v)]

    while heap:
        nd, nv = heapq.heappop(heap)
        if distance[nv] < nd:
            continue

        for pv, pd in adjList[nv]:
            td = nd + pd
            if distance[pv] > td:
                distance[pv] = td
                heapq.heappush(heap, (td, pv))

    cnt = 0
    maxValue = 0
    for i in range(1, n+1):
        if distance[i] != sys.maxsize:
            cnt += 1
            maxValue = max(maxValue, distance[i])

    print(cnt, maxValue)

for _ in range(t):
    n, d, c = map(int, sys.stdin.readline().split())

    adjList = [[] for _ in range(n+1)]

    for _ in range(d):
        a, b, s = map(int, sys.stdin.readline().split())
        adjList[b].append((a, s))

    dijkstra(n, c)


