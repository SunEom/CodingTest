#1647 도시 분할 계획

import sys

n , m = map(int, sys.stdin.readline().split())

parents = [i for i in range(n+1)]

def find(v):
    if parents[v] == v:
        return v
    return find(parents[v])

def union(u, v):
    uSet = find(u)
    vSet = find(v)

    if uSet == vSet:
        return False

    if uSet > vSet:
        parents[uSet] = vSet
    else:
        parents[vSet] = uSet

    return True

edges = []
for _ in range(m):
    a, b, c = map(int, sys.stdin.readline().split())
    edges.append((c, a, b))

edges.sort()
result = 0
remain = []
for c, a, b in edges:
    if union(a, b):
        result += c
        remain.append(c)
print(result-max(remain))