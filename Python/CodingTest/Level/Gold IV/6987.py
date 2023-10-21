#6987 월드컵

import sys
from itertools import combinations

cases = list(combinations(range(6), 2))
available = []

result = ""

def bt(idx):
    global r
    if idx == len(cases):
        for t in table:
            if t.count(0) != 3:
                r = 0
                return
        r = 1
        return
    a, b = cases[idx]
    for x, y in [(0, 2), (1, 1), (2, 0)]:
        if table[a][x] >= 1 and table[b][y] >= 1:
            table[a][x] -= 1
            table[b][y] -= 1
            bt(idx + 1)
            table[a][x] += 1
            table[b][y] += 1

for _ in range(4):
    i = list(map(int, sys.stdin.readline().split()))
    table = []
    for p in range(0, 16, 3):
        t = []
        for q in range(0, 3):
            t.append(i[p+q])
        table.append(t)
    r = 0
    bt(0)
    result += f"{r} "

print(result)


