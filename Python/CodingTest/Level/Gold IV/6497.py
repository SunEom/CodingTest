# 6497 전력난

import sys


def find(v):
    if parents[v] == v:
        return v
    else:
        return find(parents[v])


def union(a, b):
    aSet = find(a)
    bSet = find(b)

    if aSet == bSet:
        return False

    if aSet > bSet:
        parents[aSet] = bSet
        return True
    else:
        parents[bSet] = aSet
        return True


while True:
    m, n = map(int, sys.stdin.readline().split())
    if m == 0 and n == 0:
        break
    parents = [i for i in range(m)]
    result = 0
    arr = []
    for _ in range(n):
        a, b, c = map(int, sys.stdin.readline().split())
        arr.append((c, a, b))
    arr.sort()

    for r, p, q in arr:
        if not union(p, q):
            result += r

    print(result)