#1976 여행 가자

import sys

n = int(sys.stdin.readline())
m = int(sys.stdin.readline())
adjList = [list(map(int, sys.stdin.readline().split())) for _ in range(n)]

parents = [i for i in range(n)]

def find(a):
    if parents[a] == a:
        return a
    else: return find(parents[a])

def union(a,b):
    aSet = find(a)
    bSet = find(b)

    if aSet > bSet:
        parents[aSet] = bSet
    else:
        parents[bSet] = aSet

for i in range(n):
    for j in range(n):
        if adjList[i][j] == 1:
            union(i,j)

li = list(map(int, sys.stdin.readline().split()))

for i in range(0, len(li)-1):
    if find(li[i]-1) != find(li[i+1]-1):
        print("NO")
        success = False
        exit()

print("YES")