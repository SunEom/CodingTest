#1083 소트

import sys

n = int(sys.stdin.readline())

arr = list(map(int, sys.stdin.readline().split()))
s = int(sys.stdin.readline())

i = 0
while s > 0 and i<n:
    maxValue = arr[i]
    maxIdx = i
    distance = 0
    for k in range(i+1, min(i+s+1, n)):
        if maxValue < arr[k]:
            maxValue = arr[k]
            maxIdx = k
            distance = k-i

    pop = arr.pop(maxIdx)
    arr.insert(i, pop)
    s -= distance
    i+=1

print(*arr)