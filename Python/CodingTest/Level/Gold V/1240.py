#1240 노드 사이의 거리

import sys

n, m = map(int, sys.stdin.readline().split())

adjList =[[] for _ in range(n+1)]

for _ in range(n-1):
    a, b, c = map(int, sys.stdin.readline().split())
    adjList[a].append((b, c))
    adjList[b].append((a, c))

def bfs(s,e):
    visited = [False for i in range(n+1)]
    queue = [(s, 0)]
    visited[s] = True

    while len(queue) != 0 :
        pop = queue.pop(0)
        if pop[0] == e:
            print(pop[1])
            break
        for a in adjList[pop[0]]:
            if visited[a[0]] == False:
                visited[a[0]] = True
                queue.append((a[0], a[1] + pop[1]))

for _  in range(m):
    a, b = map(int, sys.stdin.readline().split())
    bfs(a, b)