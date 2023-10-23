#10159 저울

import sys
n = int(sys.stdin.readline())
m = int(sys.stdin.readline())

arr = [[0 for _ in range(n+1)] for _ in range(n+1)]

for _ in range(m):
    a, b = map(int, sys.stdin.readline().split())
    arr[a][b] = 1

for k in range(1, n+1):
    for i in range(1, n+1):
        for j in range(1, n+1):
            if arr[i][k] != 0 and arr[k][j] != 0:
                arr[i][j] = 1

for i in range(1,n+1):
    cnt = 0
    for j in range(1, n+1):
        if arr[i][j] == 0 and arr[j][i] == 0:
            cnt += 1
    print(cnt - 1)
