#18405 경쟁적 전염

import sys

n,k = map(int, sys.stdin.readline().split())

arr = []
queue = []

directions = [(1,0),(0,1),(-1,0),(0,-1)]

for i in range(n):
    temp = list(map(int, sys.stdin.readline().split()))
    arr.append(temp)
    for j in range(len(temp)):
        if temp[j] != 0:
            queue.append((i,j,0,temp[j]))

queue.sort(key=lambda x:x[3])
queue = list(map(lambda q:(q[0], q[1], q[2]), queue))

s, x, y = map(int, sys.stdin.readline().split())

while queue:
    pr, pc, pt = queue.pop(0)

    for dr, dc in directions:
        tr = pr+dr
        tc = pc+dc

        if tr in range(0, n) and tc in range(0, n) and arr[tr][tc] == 0 and pt+1 <= s:
            arr[tr][tc] = arr[pr][pc]
            queue.append((tr, tc, pt+1))

print(arr[x-1][y-1])