#2166 다각형의 면적

import sys
n = int(sys.stdin.readline())

arr = []
for _ in range(n):
    x, y = map(int, sys.stdin.readline().split())
    arr.append((x,y))
arr.append(arr[0])

a = 0.0
b = 0.0
for i in range(len(arr)-1):
    a += arr[i][0] * arr[i+1][1]
    b += arr[i][1] * arr[i+1][0]

print(round(abs(a-b)/2.0, 2))