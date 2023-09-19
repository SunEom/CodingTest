#2096 내려가기

import sys

n = int(sys.stdin.readline())

arr = []
minDp = []
maxDp = []

for i in range(n):
    temp = list(map(int, sys.stdin.readline().split()))
    arr.append(temp)

minDp = arr[0]
maxDp = arr[0]

for i in range(1, n):
    minNext = arr[i].copy()
    maxNext = arr[i].copy()
    for j in range(3):
        if j == 0:
            maxNext[j] += max(maxDp[0], maxDp[1])
            minNext[j] += min(minDp[0], minDp[1])
        elif j == 1:
            maxNext[j] += max(maxDp[0], maxDp[1], maxDp[2])
            minNext[j] += min(minDp[0], minDp[1], minDp[2])
        else:
            maxNext[j] += max(maxDp[1], maxDp[2])
            minNext[j] += min(minDp[1], minDp[2])
    minDp = minNext
    maxDp = maxNext

print(max(maxDp), min(minDp))
