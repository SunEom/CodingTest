#1027 고층 건물

import sys
n = int(sys.stdin.readline())

arr = list(map(int, sys.stdin.readline().split()))

a = [[] for _ in range(n)]

for i in range(len(arr)):
    for j in range(len(arr)):
        if i == j :
            a[i].append(0)
            continue
        else:
            a[i].append((arr[i]-arr[j])/(i-j))
result = 0


for i in range(len(arr)):
    tresult = 0

    pvalue = sys.maxsize
    for j in range(i-1, -1, -1):
        if pvalue > a[i][j]:
            pvalue = a[i][j]
            tresult += 1

    pvalue = -sys.maxsize
    for j in range(i+1, len(arr)):
        if pvalue < a[i][j]:
            pvalue = a[i][j]
            tresult += 1

    result = max(result, tresult)

print(result)