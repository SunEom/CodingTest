#11404 플로이드

import sys

n = int(sys.stdin.readline())
m = int(sys.stdin.readline())

arr = [[sys.maxsize for _ in range(n+1)] for _ in range(n+1)]

for _ in range(m):
    a, b, c = map(int, sys.stdin.readline().split())
    if arr[a][b] > c:
        arr[a][b] = c


def solve():
    for k in range(1, n+1):
        for i in range(1, n+1):
            for j in range(1, n+1):
                if i == j:
                    continue
                arr[i][j] = min(arr[i][j], arr[i][k] + arr[k][j])

solve()

for a in arr[1:]:
    for b in a[1:]:
        if b == sys.maxsize:
            print("0", end=" ")
        else:
            print(b, end=" ")

    print()