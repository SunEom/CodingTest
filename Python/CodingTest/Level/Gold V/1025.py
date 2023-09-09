#1025 제곱수 찾기

import sys

def isSqr(s):
    s = int(s)
    return int(s**0.5)**2 == s

n, m = map(int, sys.stdin.readline().split())
result = -1

arr = []
for _ in range(n):
    arr.append(list(map(int, list(sys.stdin.readline().strip()))))

for r in range(0, n):
    for c in range(0, m):
        for dr in range(-n, n):
            for dc in range(-m, m):
                s = ""
                x, y = r, c
                if dr == 0 and dc == 0:
                    continue

                while (0<= x < n) and (0<= y < m):
                    s += f"{arr[x][y]}"
                    if isSqr(s):
                        result = max(result, int(s))
                    x += dr
                    y += dc

print(result)
