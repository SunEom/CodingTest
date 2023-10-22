#9019 DSLR

import sys

t = int(sys.stdin.readline())

def bfs(s, t):
    visited = {s: True}
    queue = [(s, "")]
    idx = 0
    while idx < len(queue):
        ns, no = queue[idx]
        if ns == t:
            print(no)
            break

        t1 = ns * 2 % 10000
        t2 = (ns - 1 + 10000) % 10000
        t3 = ns%1000*10 + ns//1000
        t4 = ns%10*1000 + ns//10

        if t1 not in visited:
            visited[t1] = True
            queue.append((t1, no+"D"))

        if t2 not in visited:
            visited[t2] = True
            queue.append((t2, no+"S"))

        if t3 not in visited:
            visited[t3] = True
            queue.append((t3, no+"L"))

        if t4 not in visited:
            visited[t4] = True
            queue.append((t4, no+"R"))

        idx += 1

for _ in range(t):
    start, target = map(int, sys.stdin.readline().split())
    bfs(start, target)