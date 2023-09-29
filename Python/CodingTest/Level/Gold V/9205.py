#9205 맥주 마시면서 걸어가기

import sys

t = int(sys.stdin.readline())

def getDist(x1, y1, x2, y2):
    return (abs(x1-x2) + abs(y1-y2))/50

def bfs(x, y):
    visited = {pos: False for pos in store}
    queue = [(x, y)]

    while len(queue) > 0 :
        px, py = queue.pop(0)

        if getDist(px, py, fx, fy) <= 20:
            return "happy"

        for s in store:
            if not visited[s] and getDist(px, py, s[0], s[1]) <= 20:
                visited[s] = True
                queue.append((s[0], s[1]))


    return "sad"


for _ in range(t):
    n = int(sys.stdin.readline())
    hx, hy = map(int, sys.stdin.readline().split())
    store = []
    for _ in range(n):
        sx, sy = map(int, sys.stdin.readline().split())
        store.append((sx, sy))
    fx, fy = map(int, sys.stdin.readline().split())

    print(bfs(hx, hy))
