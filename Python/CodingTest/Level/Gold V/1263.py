#1263 시간 관리

import sys

n = int(sys.stdin.readline())
arr = []
result = 1000001
for _ in range(n):
    t, s = map(int, sys.stdin.readline().split())
    arr.append((t, s))

arr.sort(key=lambda x:x[1], reverse=True)
for a in arr:
    result = min(result, a[1]) - a[0]

if result < 0:
    print(-1)
else:
    print(result)
