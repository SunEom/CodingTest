#1239 차트
import sys
from itertools import permutations

n = int(sys.stdin.readline())
arr = list(map(int, sys.stdin.readline().split()))
result = 0

for r in permutations(arr, len(arr)):
    temp = [False for _ in range(101)]
    temp[0] = True
    tresult = 0
    s = 0
    for i in range(0, len(r)):
        s += r[i]
        temp[s] = True

    for t in range(0, 50):
        if temp[t] and temp[t+50]:
            tresult += 1
    result = max(result, tresult)
print(result)