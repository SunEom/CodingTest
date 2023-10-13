#2056 wkrdjq

import sys

n = int(sys.stdin.readline())

t = [0 for _ in range(n+1)]
p = [[] for _ in range(n+1)]
result = 0
for i in range(1, n+1):
    li = list(map(int, sys.stdin.readline().split()))
    time = li[0]
    cnt = li[1]
    prev = li[2:]

    t[i] = time
    p[i] = prev


for i in range(1, n+1):
    temp = list(map(lambda x:t[x], p[i]))
    k = 0
    if temp:
        k = max(temp)

    t[i] += k
    result = max(result, t[i])

print(result)

