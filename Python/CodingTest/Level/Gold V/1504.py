#1504 특정한 최단 경로

import sys
import heapq

def dijkstra(graph, start):
    distance = {node: sys.maxsize for node in graph}
    distance[start] = 0
    heap = []
    heapq.heappush(heap, [distance[start], start])

    while heap:
        curDist, curDest = heapq.heappop(heap)

        if distance[curDest] < curDist:
            continue

        for newDest, newDist in graph[curDest].items():
            dist = curDist + newDist
            if dist < distance[newDest]:
                distance[newDest] = dist
                heapq.heappush(heap, [dist, newDest])

    return distance

n, m = map(int, sys.stdin.readline().split())
g = {k: {} for k in range(1, n+1)}

for _ in range(m):
    a, b, c = map(int, sys.stdin.readline().split())
    g[a][b] = c
    g[b][a] = c

u, v = map(int, sys.stdin.readline().split())

result = 0
r1 = dijkstra(g, 1)
ru = dijkstra(g, u)
rv = dijkstra(g, v)

result = min(r1[u]+ru[v]+rv[n], r1[v]+rv[u]+ru[n])

if result >= sys.maxsize:
    print(-1)
else:
    print(result)