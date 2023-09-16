#1717 집합의 표현

import sys

n, m = map(int, sys.stdin.readline().split())

s = list(range(n+1))

def find(a):
    if s[a] == a:
        return a
    else:
        s[a] = find(s[a])
        return s[a]

def union(a, b):
    s[find(b)] = find(a)

for _ in range(m):
    k, a, b = map(int, sys.stdin.readline().split())
    if k == 0:
        union(a,b)
    else:
        if find(a) == find(b):
            print("YES")
        else:
            print("NO")
