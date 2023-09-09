#1005 ACM Craft

import sys

t = int(sys.stdin.readline())

for _  in range(t):
    n, k = map(int, sys.stdin.readline().split())
    time = [0] + list(map(int, sys.stdin.readline().split()))
    indegree = [0 for _ in range(n+1)]
    outline = [[] for _ in range(n+1)]
    dp = [0 for _ in range(n+1)]
    for _ in range(k):
        a, b = map(int, sys.stdin.readline().split())
        indegree[b] += 1
        outline[a].append(b)

    target = int(sys.stdin.readline())

    queue = []
    for i in range(1,n+1):
        if indegree[i] == 0:
            queue.append(i)
            dp[i] = time[i]

    while len(queue) != 0:
        pop = queue.pop(0)

        for edge in outline[pop]:
            dp[edge] = max(dp[edge], dp[pop] + time[edge])
            indegree[edge] -= 1
            if indegree[edge] == 0:
                queue.append(edge)

    print(dp[target])


