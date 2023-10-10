#1922 네트워크 연결

import sys

n = int(sys.stdin.readline())
m = int(sys.stdin.readline())
result = 0
edges = []

for _ in range(m):
    a, b, c = map(int, sys.stdin.readline().split())

    edges.append((c, a, b))

edges.sort()

parents = [i for i in range(n+1)]

def find(v):
    if parents[v] == v: return v
    return find(parents[v])

def union(a,b):
    aSet = find(a)
    bSet = find(b)

    if aSet == bSet:
        return False

    if aSet > bSet:
        parents[aSet] = bSet
    else:
        parents[bSet] = aSet

    return True

for c, a, b in edges:
    if union(a, b):
        result += c

print(result)