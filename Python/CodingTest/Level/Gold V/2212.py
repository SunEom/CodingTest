#2212 센서

import sys
n = int(sys.stdin.readline())
k = int(sys.stdin.readline())

arr = list(map(int, sys.stdin.readline().split()))
arr.sort()
dist = []

if n <= k:
    print(0)
else:
    for i in range(0, n - 1):
        dist.append(arr[i + 1] - arr[i])
    dist.sort()
    s = 0
    for i in range(0, len(dist)-k+1):
        s += dist[i]
    print(s)
