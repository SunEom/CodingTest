#1753 최단 경로

import sys
import heapq

v, e = map(int, sys.stdin.readline().split())
k = int(sys.stdin.readline())

dist = [sys.maxsize for _ in range(v+1)]
dist[k] = 0

edges = [[] for _ in range(v+1)]
q = [(0, k)]

for _ in range(e):
    a, b, c = map(int, sys.stdin.readline().split())
    edges[a].append((b, c))

while q:
    nowDist, nowDest = heapq.heappop(q)

    if dist[nowDest] < nowDist:
        continue

    for newDest, newDist in edges[nowDest]:
        value = nowDist + newDist
        if dist[newDest] > value:
            dist[newDest] = value
            heapq.heappush(q, (value, newDest))


for d in dist[1:]:
    if d == sys.maxsize:
        print("INF")
    else:
        print(d)