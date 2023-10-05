#1197 최소 스패닝 트리

import sys
import heapq

v, e = map(int, sys.stdin.readline().split())
result = 0
li = []

s = [i for i in range(v)]

def find(q):
    if s[q] != q:
        return find(s[q])
    return q

def union(p, q):
    pSet = find(p)
    qSet = find(q)

    if pSet < qSet:
        s[pSet] = qSet
        return True
    elif pSet > qSet:
        s[qSet] = pSet
        return True
    return False

for _ in range(e):
    a, b, c = map(int, sys.stdin.readline().split())
    li.append((c, a-1, b-1))

heapq.heapify(li)

while li:
    c, a, b = heapq.heappop(li)
    if union(a, b):
        result += c

print(result)