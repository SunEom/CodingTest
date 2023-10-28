#1005 ACM Craft

import sys

t = int(sys.stdin.readline())

for _ in range(t):
    n, k = map(int, sys.stdin.readline().split())
    d = [0] + list(map(int, sys.stdin.readline().split()))
    next = [[] for _ in range(n+1)]
    remain = [0 for _ in range(n+1)]
    times = [0 for _ in range(n+1)]


    for _ in range(k):
        a, b = map(int, sys.stdin.readline().split())
        remain[b] += 1
        next[a].append(b)

    w = int(sys.stdin.readline())

    queue = []

    for i in range(1, n + 1):
        if remain[i] == 0:
            queue.append(i)
            times[i] = d[i]

    while queue:
        i = queue.pop(0)

        for j in next[i]:
            remain[j] -= 1
            times[j] = max(times[j], d[j] + times[i])
            if remain[j] == 0:
                queue.append(j)

    print(times[w])

