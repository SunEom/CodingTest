#2138 전구와 스위치

import sys

n = int(sys.stdin.readline())

lights = list(map(int, list(sys.stdin.readline().strip())))
target = list(map(int, list(sys.stdin.readline().strip())))

def solve(l):
    cnt = 0
    L = l.copy()
    for i in range(1, n):
        if L[i-1] == target[i-1]:
            continue
        cnt += 1
        for j in range(i-1, i+2):
            if j < n:
                L[j] = 1 - L[j]
    if L == target:
        return cnt
    else:
        return sys.maxsize

result = solve(lights)
lights[0] = 1 - lights[0]
lights[1] = 1 - lights[1]

result = min(result, solve(lights)+1)
if result == sys.maxsize:
    print(-1)
else:
    print(result)