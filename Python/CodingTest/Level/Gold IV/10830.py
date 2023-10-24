#10830 행렬 제곱

import sys

n, b = map(int, sys.stdin.readline().split())
mat = [list(map(int, sys.stdin.readline().split())) for _ in range(n)]

def multiply(m1, m2):
    global n
    temp = [[0 for _ in range(n)] for _ in range(n)]

    for i in range(0, n):
        for j in range(0, n):
            for k in range(0, n):
                temp[i][j] += m1[i][k] * m2[k][j]
                temp[i][j] %= 1000

    return temp

def square(m, k):
    if k == 1:
        return m
    t = square(m, k // 2)
    t = multiply(t, t)
    if k % 2 == 0:
        return t
    else:
        return multiply(t, m)

result = square(mat, b)

for r in result:
    r = list(map(lambda x:x%1000, r))
    print(*r)
