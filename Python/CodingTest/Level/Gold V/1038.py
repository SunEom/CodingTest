#1038 감소하는 수

import sys
from itertools import combinations

n = int(sys.stdin.readline())
li = []

for i in range(1, 11):
    for p in combinations(range(10), i):
        li.append(int("".join(map(str, sorted(p, reverse=True)))))

li.sort()

if n >= len(li):
    print(-1)
else:
    print(li[n])
