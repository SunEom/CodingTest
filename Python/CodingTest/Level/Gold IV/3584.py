#3584 가장 가까운 공통 조상

import sys

T = int(sys.stdin.readline())

for _ in range(T):
    N = int(sys.stdin.readline())
    parents = [i for i in range(N+1)]
    visited = [False for _ in range(N + 1)]

    for _ in range(N-1):
        a, b = map(int, sys.stdin.readline().split())
        parents[b] = a

    ta, tb = map(int, sys.stdin.readline().split())

    while parents[ta] != ta:
        visited[ta] = True
        ta = parents[ta]

    while not visited[tb]:
        tb = parents[tb]

    print(tb)