#1916 최소비용 구하기

import heapq
import sys

n = int(sys.stdin.readline())
m = int(sys.stdin.readline())

adjList = [[] for _ in range(n+1)]
dist = [sys.maxsize for _ in range(n+1)]

for _ in range(m):
    a, b, c = map(int, sys.stdin.readline().split())
    adjList[a].append((b, c))
s, e = map(int, sys.stdin.readline().split())

def dijkstra(x):
     h = []
     heapq.heappush(h, (x, 0))
     dist[x] = 0

     while h:
        y, d = heapq.heappop(h)

        if dist[y] < d:
             continue

        for tx, td in adjList[y]:
            td += d
            if dist[tx] > td:
                heapq.heappush(h, (tx, td))
                dist[tx] = td

dijkstra(s)

print(dist[e])