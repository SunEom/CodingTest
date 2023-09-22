#2230 수고르기

import sys

n, m = map(int, sys.stdin.readline().split())

arr = [int(sys.stdin.readline()) for _ in range(n)]
arr.sort()
result = sys.maxsize
i = 0
j = 0

while True:
    if j >= n or i >= n:
        break
    diff = arr[j] - arr[i]
    if diff >= m :
        result = min(result, diff)
        i += 1
    else:
        j += 1

print(result)